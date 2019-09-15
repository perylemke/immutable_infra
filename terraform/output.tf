output "project" {
  value       = var.project
  description = "The GCP Project where all resources are deployed."
}

# Core Outputs
output "region" {
  value       = module.core.region
  description = "Region of the subnet."
}

output "instance_group_name" {
  value       = module.core.instance_group_name
  description = "The name of the Managed Instance Group that contains the API."
}

output "instance_group_url" {
  value       = module.core.instance_group_url
  description = "The URL of the Managed Instance Group that contains the API."
}

output "instance_template_name" {
  value       = module.core.instance_template_name
  description = "The name of the Instance Template used by the API."
}

output "load_balancing_ip" {
  value       = module.core.load_balancing_ip
  description = "The IP of the Load Balancing used by the API."
}

# Network Outputs
output "network_name" {
  value       = module.network.network_name
  description = "Network used on the project."
}

output "subnetwork_name" {
  value       = module.network.subnetwork_name
  description = "Network used on the project."
}