# General Vars
variable "project" {
    default = "immutable-infra"
}

variable "region" {
    default = "us-central1"
}

variable "zone" {
    default = "us-central1-c"
}

# Autoscaler Vars
variable "max_replicas" {
    default = 3
}

variable "min_replicas" {
    default = 1
}

variable "cooldown_period" {
    default = 60
}

variable "target_cpu" {
    default = 0.8
}

# Instance Groups Vars
variable "target_size" {
    default = 1
}

variable "port_api_name" {
    default = "http"
}

variable "port_api_number" {
    default = 80
}

variable "type_update" {
    default = "PROACTIVE"
}

variable "minimal_action" {
    default = "REPLACE"
}

variable "max_surge_fixed" {
    default = 1
}

variable "max_unavailable_fixed" {
    default = 0
}

variable "min_ready_sec" {
    default = 0
}

variable "initial_delay_sec" {
    default = 50
}

# Instance Template Vars
variable "machine_type" {
    default = "g1-small"
}

variable "environment" {
    default = "prod"
}

variable "image" {
    default = "belegost-"
}

# Healtcheck Vars
variable "check_interval_sec" {
    default = "5"
}

variable "timeout_sec" {
    default = "5"
}

variable "healthy_threshold" {
    default = "2"
}

variable "unhealthy_threshold" {
    default = "2"
}

variable "request_path" {
    default = "/status"
}

# Network
variable "ip_range" {
    default = "10.80.0.0/20"
}

# Load Balance
variable "protocol" {
    default = "HTTP"
}

# Firewall
variable "ssh_port" {
    default = "22"
}

variable "http_port" {
    default = "80"
}

variable "https_port" {
    default = "443"
}

variable "tag_ssh" {
    default = "ssh"
}

variable "tag_icmp" {
    default = "icmp"
}

variable "tag_http" {
    default = "http"
}

variable "tag_https" {
    default = "https"
}

variable "allow_all_ranges" {
    default = "0.0.0.0/0"
}

