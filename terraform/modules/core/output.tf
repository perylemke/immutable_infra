output "region" {
  value       = var.region
}

output "instance_group_url" {
  value       = google_compute_instance_group_manager.apery-group.self_link
}

output "instance_group_name" {
  value       = google_compute_instance_group_manager.apery-group.name
}

output "instance_template_name" {
  value       = google_compute_instance_template.apery-template.name
}

output "load_balancing_ip" {
  value       = google_compute_global_address.apery-ip.address
}