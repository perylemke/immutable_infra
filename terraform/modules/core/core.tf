provider "google-beta" {
  region      = "${var.region}"
  zone        = "${var.zone}"
}
resource "google_compute_autoscaler" "apery-autoscaler" {
  name   = "${var.autoscaler}"
  zone   = "${var.zone}"
  target = "${google_compute_instance_group_manager.apery-group.self_link}"

  autoscaling_policy = {
    max_replicas    = "${var.max_replicas}"
    min_replicas    = "${var.min_replicas}"
    cooldown_period = "${var.cooldown_period}"

    cpu_utilization {
      target = "${var.target_cpu}"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "apery-group" {
  provider           = "google-beta"
  name               = "${var.group_name}"
  base_instance_name = "${var.base_instance_name}"
  zone               = "${var.zone}"

  target_size  = "${var.target_size}"

  version {
    name               = "${var.name_version}"
    instance_template  = "${google_compute_instance_template.apery-template.self_link}"
  }

  named_port {
      name = "${var.port_api_name}"
      port = "${var.port_api_number}"
  }

  update_policy { 
    type = "${var.type_update}"
    minimal_action = "${var.minimal_action}"
    max_surge_fixed = "${var.max_surge_fixed}"
    max_unavailable_fixed = "${var.max_unavailable_fixed}"
    min_ready_sec = "${var.min_ready_sec}"
  }

  auto_healing_policies {
    health_check      = "${google_compute_health_check.apery-healthcheck.self_link}"
    initial_delay_sec = "${var.initial_delay_sec}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "google_compute_instance_template" "apery-template" {
  name_prefix  = "${var.name_prefix}"
  machine_type = "${var.machine_type}"
  region       = "${var.region}"
  tags         = ["${var.tag_sinatra}", "${var.tag_icmp}", "${var.tag_http}"]

  labels = {
    project     = "apery"
    environment = "${var.environment}"
  }

  // boot disk
  disk {
    source_image = "${var.image}"
  }

  // networking
  network_interface {
    subnetwork = "${var.subnetwork}"

    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_health_check" "apery-healthcheck" {
  name                = "${var.name_health_check}"
  check_interval_sec  = "${var.check_interval_sec}"
  timeout_sec         = "${var.timeout_sec}"
  healthy_threshold   = "${var.healthy_threshold}"
  unhealthy_threshold = "${var.unhealthy_threshold}"

  http_health_check {
    request_path = "${var.request_path}"
    port         = "${var.port_api_number}"
  }
}