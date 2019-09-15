output "network_name" {
  value       = google_compute_network.apery-network.name
}

output "subnetwork_name" {
  value       = google_compute_subnetwork.apery-subnet.name
}