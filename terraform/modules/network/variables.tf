variable "environment" {
  type        = string
  description = "Environment of the project."
}

variable "ip_range" {
  type        = string
  description = "IP Range of the subnet."
}

variable "region" {
  type        = string
  description = "Region of the subnet."
}

variable "ssh_port" {
  type        = string
  description = "SSH port - Used to Molecule."
}

variable "allow_all_ranges" {
  type        = string
  description = "Unleash to all IPs - Used to HTTP-HTTPS and ICMP tags."
}

variable "tag_ssh" {
  type        = string
  description = "SSH tag used to Molecule."
}

variable "tag_icmp" {
  type        = string 
  description = "Tag used to ICMP procotol."
}

variable "tag_http" {
  type        = string
  description = "Tag used to HTTP port."
}

variable "tag_https" {
  type        = string
  description = "Tag used to HTTPS port."
}

variable "http_port" {
  type        = string
  description = "HTTP port."
}

variable "https_port" {
  type        = string
  description = "HTTPS port."
}
