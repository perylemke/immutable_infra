# Providers supporters
provider "google-beta" {
  project = var.project
  region  = var.region
}

provider "google" {
  project = var.project
  region  = var.region
}

terraform {
  # The modules used in this example have been updated with 0.12 syntax, which means the example is no longer
  # compatible with any versions below 0.12.
  required_version = ">= 0.12"
}

# Bucket where state file is saved
terraform {
  backend "gcs" {
    bucket = "immutableinfra-tf-state"
    prefix = "tf-state/apery-state"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE APERY INFRA
# ---------------------------------------------------------------------------------------------------------------------

module "network" {
  source  = "./modules/network"

  environment      = var.environment
  ip_range         = var.ip_range
  region           = var.region
  ssh_port         = var.ssh_port
  allow_all_ranges = var.allow_all_ranges
  tag_ssh          = var.tag_ssh
  tag_icmp         = var.tag_icmp
  http_port        = var.http_port
  https_port       = var.https_port
  tag_http         = var.tag_http
  tag_https        = var.tag_https
}

module "core" {
  source  = "./modules/core"

  environment           = var.environment
  zone                  = var.zone
  region                = var.region
  max_replicas          = var.max_replicas
  min_replicas          = var.min_replicas
  cooldown_period       = var.cooldown_period
  target_cpu            = var.target_cpu
  target_size           = var.target_size
  port_api_name         = var.port_api_name
  port_api_number       = var.port_api_number
  type_update           = var.type_update
  image                 = var.image
  minimal_action        = var.minimal_action
  max_surge_fixed       = var.max_surge_fixed
  max_unavailable_fixed = var.max_unavailable_fixed
  min_ready_sec         = var.min_ready_sec
  initial_delay_sec     = var.initial_delay_sec
  machine_type          = var.machine_type
  tag_icmp              = var.tag_icmp
  tag_http              = var.tag_http
  tag_https             = var.tag_https
  protocol              = var.protocol
  check_interval_sec    = var.check_interval_sec
  timeout_sec           = var.timeout_sec
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
  request_path          = var.request_path
}