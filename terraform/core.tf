data "google_compute_subnetwork" "apery-subnetwork" {
  name = google_compute_subnetwork.apery-subnet.name
}

# App Infra

resource "google_compute_autoscaler" "apery-autoscaler" {
  name   = format("%s%s", "apery-autoscaler-", var.environment)
  zone   = var.zone
  target = google_compute_instance_group_manager.apery-group.self_link

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    cpu_utilization {
      target = var.target_cpu
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "apery-group" {
  provider           = google-beta
  name               = format("%s%s", "apery-instance-group-", var.environment)
  base_instance_name = format("%s%s", "apery-instance-", var.environment)
  zone               = var.zone

  target_size = var.target_size

  version {
    name              = format("%s%s", "apery-version-", var.environment)
    instance_template = google_compute_instance_template.apery-template.self_link
  }

  named_port {
    name = var.port_api_name
    port = var.port_api_number
  }

  update_policy {
    type                  = var.type_update
    minimal_action        = var.minimal_action
    max_surge_fixed       = var.max_surge_fixed
    max_unavailable_fixed = var.max_unavailable_fixed
    min_ready_sec         = var.min_ready_sec
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.apery-healthcheck.self_link
    initial_delay_sec = var.initial_delay_sec
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_template" "apery-template" {
  name_prefix  = format("%s%s%s", "apery-template-", var.environment, "-")
  machine_type = var.machine_type
  region       = var.region
  tags         = [var.tag_icmp, var.tag_http_https]

  labels = {
    project     = "apery"
    environment = var.environment
  }

  // boot disk
  disk {
    source_image = format("%s%s", var.image, var.environment)
  }

  // networking
  network_interface {
    subnetwork = data.google_compute_subnetwork.apery-subnetwork.network

    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

#  Load Balance

resource "google_compute_global_forwarding_rule" "apery-forwarding-rule" {
  name       = format("%s%s", "apery-frontend-http-", var.environment)
  target     = google_compute_target_http_proxy.apery-target-http-proxy.self_link
  port_range = "80"
  ip_address = google_compute_global_address.apery-ip.address
  depends_on = [google_compute_global_address.apery-ip]
}

resource "google_compute_global_address" "apery-ip" {
  name = format("%s%s", "apery-ip-", var.environment)
}

resource "google_compute_target_http_proxy" "apery-target-http-proxy" {
  name    = format("%s%s", "apery-http-proxy-", var.environment)
  url_map = google_compute_url_map.apery-lb.self_link
}

resource "google_compute_url_map" "apery-lb" {
  name            = format("%s%s", "apery-lb-", var.environment)
  default_service = google_compute_backend_service.apery-backend.self_link
}

resource "google_compute_backend_service" "apery-backend" {
  name          = format("%s%s", "apery-backend-", var.environment)
  port_name     = var.port_api_name
  protocol      = var.protocol
  timeout_sec   = 30
  health_checks = [google_compute_health_check.apery-healthcheck.self_link]

  backend {
    group = google_compute_instance_group_manager.apery-group.instance_group
  }
}

resource "google_compute_health_check" "apery-healthcheck" {
  name                = format("%s%s", "apery-healthcheck-", var.environment)
  check_interval_sec  = var.check_interval_sec
  timeout_sec         = var.timeout_sec
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold

  http_health_check {
    request_path = var.request_path
    port         = var.port_api_number
  }
}

