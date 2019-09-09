# Network

resource "google_compute_network" "apery-network" {
  name                    = format("%s%s", "demo-apery-", var.environment)
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "apery-subnet" {
  name          = format("%s%s", "demo-apery-", var.environment)
  ip_cidr_range = var.ip_range
  region        = var.region
  network       = google_compute_network.apery-network.self_link
}

# Firewall

resource "google_compute_firewall" "ssh" {
  name    = format("%s%s", "ssh-firewall-", var.environment)
  network = google_compute_network.apery-network.self_link

  allow {
    protocol = "tcp"
    ports    = [var.ssh_port]
  }

  source_ranges = [var.allow_all_ranges]
  source_tags   = [var.tag_ssh]
  target_tags   = [var.tag_ssh]
}

resource "google_compute_firewall" "icmp" {
  name    = format("%s%s", "icmp-firewall-", var.environment)
  network = google_compute_network.apery-network.self_link

  allow {
    protocol = "icmp"
  }

  source_ranges = [var.allow_all_ranges]
  source_tags   = [var.tag_icmp]
  target_tags   = [var.tag_icmp]
}

resource "google_compute_firewall" "http-https" {
  name    = format("%s%s", "http-https-firewall-", var.environment)
  network = google_compute_network.apery-network.self_link

  allow {
    protocol = "tcp"
    ports    = [var.http_port, var.https_port]
  }

  source_ranges = [var.allow_all_ranges]
  source_tags   = [var.tag_http_https]
  target_tags   = [var.tag_http_https]
}

