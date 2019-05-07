resource "google_compute_global_forwarding_rule" "apery-forwarding-rule" {
  name       = "${var.forwarding_rule}"
  target     = "${google_compute_target_http_proxy.apery-target-http-proxy.self_link}"
  port_range = "80"
  ip_address = "${google_compute_global_address.apery-ip.address}"
  depends_on = ["google_compute_global_address.apery-ip"]
}

resource "google_compute_global_address" "apery-ip" {
  name = "${var.ip_name}"
}

resource "google_compute_target_http_proxy" "apery-target-http-proxy" {
  name        = "${var.http_proxy}"
  url_map     = "${google_compute_url_map.apery-lb.self_link}"
}

resource "google_compute_url_map" "apery-lb" {
  name        = "${var.lb_name}"
  default_service = "${google_compute_backend_service.apery-backend.self_link}"
}

resource "google_compute_backend_service" "apery-backend" {
  name        = "${var.backend_name}"
  port_name   = "${var.port_name}"
  protocol    = "${var.protocol}"
  timeout_sec = 30
  health_checks = ["${google_compute_health_check.apery-healthcheck.self_link}"]

  backend {
    group = "${google_compute_instance_group_manager.apery-group.instance_group}"
  }
}