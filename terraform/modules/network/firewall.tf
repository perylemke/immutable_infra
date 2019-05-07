resource "google_compute_firewall" "ssh" {
  name    = "${var.fw_ssh}"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["${var.ssh_port}"]
  }

  source_ranges = ["${var.allow_all_ranges}"]
  source_tags   = ["${var.tag_ssh}"]
  target_tags   = ["${var.tag_ssh}"]
}

resource "google_compute_firewall" "icmp" {
  name    = "${var.fw_icmp}"
  network = "${var.network}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["${var.allow_all_ranges}"]
  source_tags   = ["${var.tag_icmp}"]
  target_tags   = ["${var.tag_icmp}"]
}

resource "google_compute_firewall" "http-https" {
  name    = "${var.fw_http_https}"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["${var.internet_port}"]
  }

  source_ranges = ["${var.allow_all_ranges}"]
  source_tags   = ["${var.tag_http-https}"]
  target_tags   = ["${var.tag_http-https}"]
}