resource "google_compute_network" "apery-network" {
  name = "${var.network}"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}

resource "google_compute_subnetwork" "apery-subnetwork" {
  name          = "${var.subnetwork}"
  ip_cidr_range = "${var.ip_cidr_range}"
  region        = "${var.region}"
  network       = "${google_compute_network.apery-subnetwork.self_link}"
}
