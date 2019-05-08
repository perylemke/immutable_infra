resource "google_compute_network" "apery-network" {
  name                    = "${format("%s%s", "demo-apery-", var.environment)}"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "apery-subnet" {
  name          = "${format("%s%s", "demo-apery-", var.environment)}"
  ip_cidr_range = "${var.ip_range}"
  region        = "${var.region}"
  network       = "${google_compute_network.apery-network.self_link}"
}