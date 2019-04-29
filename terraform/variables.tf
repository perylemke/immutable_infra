# General Vars
variable "project" {}
variable "region" {}
variable "zone" {}
variable "subnetwork" {}

# Autoscaler Vars
variable "autoscaler" {}
variable "max_replicas" {}
variable "min_replicas" {}
variable "cooldown_period" {}
variable "target_cpu" {}

# Instance Groups Vars
variable "group_name" {}
variable "base_instance_name" {}
variable "target_size" {}
variable "name_version" {}
variable "port_sinatra_name" {}
variable "port_sinatra_number" {}
variable "type_update" {}
variable "minimal_action" {}
variable "max_surge_fixed" {}
variable "max_unavailable_fixed" {}
variable "min_ready_sec" {}
variable "initial_delay_sec" {}

# Instance Template Vars
variable "name_prefix" {}
variable "machine_type" {}
variable "environment" {}
variable "image" {}
variable "tag_http" {}
variable "tag_icmp" {}
variable "tag_sinatra" {}

# Healtcheck Vars
variable "name_health_check" {}
variable "check_interval_sec" {}
variable "timeout_sec" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "request_path" {}

# External IP
variable "ip_name" {}

# Load Balance
variable "lb_name" {}
variable "http_proxy" {}
variable "backend_name" {}
variable "port_name" {}
variable "protocol" {}
variable "forwarding_rule" {}

