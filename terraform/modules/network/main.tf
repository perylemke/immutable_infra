terraform {
  required_version = ">= 0.12"
}

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

resource "google_compute_firewall" "http" {
  name    = format("%s%s", "http-firewall-", var.environment)
  network = google_compute_network.apery-network.self_link

  allow {
    protocol = "tcp"
    ports    = [var.http_port]
  }

  source_ranges = [var.allow_all_ranges]
  source_tags   = [var.tag_http]
  target_tags   = [var.tag_http]
}

resource "google_compute_firewall" "https" {
  name    = format("%s%s", "https-firewall-", var.environment)
  network = google_compute_network.apery-network.self_link

  allow {
    protocol = "tcp"
    ports    = [var.https_port]
  }

  source_ranges = [var.allow_all_ranges]
  source_tags   = [var.tag_https]
  target_tags   = [var.tag_https]
}