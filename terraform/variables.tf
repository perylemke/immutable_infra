# General Vars
variable "project" {}
variable "region" {}
variable "zone" {}

# Autoscaler Vars
variable "max_replicas" {}
variable "min_replicas" {}
variable "cooldown_period" {}
variable "target_cpu" {}

# Instance Groups Vars
variable "target_size" {}
variable "port_api_name" {}
variable "port_api_number" {}
variable "type_update" {}
variable "minimal_action" {}
variable "max_surge_fixed" {}
variable "max_unavailable_fixed" {}
variable "min_ready_sec" {}
variable "initial_delay_sec" {}

# Instance Template Vars
variable "machine_type" {}
variable "environment" {}
variable "image" {}

# Healtcheck Vars
variable "check_interval_sec" {}
variable "timeout_sec" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "request_path" {}

# Load Balance
variable "protocol" {}

# Firewall
variable "ssh_port" {}
variable "http_https_port" {}
variable "tag_ssh" {}
variable "tag_icmp" {}
variable "tag_http_https" {}