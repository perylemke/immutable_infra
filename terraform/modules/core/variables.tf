variable "environment" {
  type        = string
  description = "Environment of the project."
}

variable "zone" {
  type        = string
  description = "Zone of the project."
}

variable "region" {
  type        = string
  description = "Region of the project."
}

variable "max_replicas" {
  type        = string
  description = "Maximum of the replicas on instance group."
}

variable "min_replicas" {
  type        = string
  description = "Minimum of the instances on instance group."
}

variable "cooldown_period" {
  type        = string
  description = "The number of seconds that the autoscaler should wait before it starts collecting information from a new instance."
}

variable "target_cpu" {
  type        = string
  description = "The target CPU utilization that the autoscaler should maintain. Must be a float value in the range (0, 1]. If not specified, the default is 0.6."
}

variable "target_size" {
  type        = string
  description = "The target number of running instances for this managed instance group. This value should always be explicitly set unless this resource is attached to an autoscaler, in which case it should never be set."
}

variable "port_api_name" {
  type        = string
  description = "Name of backend port. The same name should appear in the instance groups referenced by this service."
}

variable "port_api_number" {
  type        = string
  description = "The TCP port number for the HTTP health check request. The default value is 80."
}

variable "type_update" {
  type        = string
  description = "Type of Update on Deploy."
}

variable "image" {
  type        = string
  description = "Image used on Instances."
}

variable "minimal_action" {
  type        = string
  description = "Minimal action to be taken on an instance."
}

variable "max_surge_fixed" {
  type        = string
  description = "The maximum number of instances that can be created above the specified targetSize during the update process."
}

variable "max_unavailable_fixed" {
  type        = string
  description = "The maximum number of instances that can be unavailable during the update process."
}

variable "min_ready_sec" {
  type        = string
  description = "Minimum number of seconds to wait for after a newly created instance becomes available."
}

variable "initial_delay_sec" {
  type        = string
  description = "The number of seconds that the managed instance group waits before it applies autohealing policies to new instances or recently recreated instances."
}

variable "machine_type" {
  type        = string
  description = " The machine type to create."
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

variable "protocol" {
  type        = string
  description = "The protocol this BackendService uses to communicate with backends. Possible values are HTTP, HTTPS, HTTP2, TCP, and SSL."
}

variable "check_interval_sec" {
  type        = string
  description = "How often (in seconds) to send a health check."
}

variable "timeout_sec" {
  type        = string
  description = "How long (in seconds) to wait before claiming failure."
}

variable "healthy_threshold" {
  type        = string
  description = "A so-far unhealthy instance will be marked healthy after this many consecutive successes."
}

variable "unhealthy_threshold" {
  type        = string
  description = "A so-far healthy instance will be marked unhealthy after this many consecutive failures."
}

variable "request_path" {
  type        = string
  description = "The request path of the HTTP health check request. The default value is /."
}
