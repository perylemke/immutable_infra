# Network Vars
variable "network" {}
variable "auto_create_subnetworks" { default = false }
variable "subnetwork" {}
variable "ip_cidr_range" {}
variable "region" {}

# Firewall Vars
variable "fw_ssh" {}
variable "fw_http_https" {}
variable "ssh_port" {}
variable "allow_all_ranges" {}
variable "tag_ssh" {}
variable "tag_icmp" {}
variable "tag_http-https" {}