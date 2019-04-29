# General Vars
project = "perylemke"
region = "us-central1"
zone = "us-central1-c"
network = "pery-prod"
subnetwork = "pery-prod"

# Autoscaler Vars
autoscaler = "apery-autoscaler"
max_replicas = 3
min_replicas = 1
cooldown_period = 60
target_cpu = 0.8

# Instance Group Vars
group_name = "apery-instance-group"
base_instance_name = "apery-instance"
target_size = 1
name_version = "apery-version"
port_sinatra_name = "sinatra"
port_sinatra_number = 80
type_update = "PROACTIVE"
minimal_action = "REPLACE"
max_surge_fixed = 1
max_unavailable_fixed = 0
min_ready_sec = 0
initial_delay_sec = 50

# Template Instance Vars
name_prefix = "apery-template-production-"
machine_type = "g1-small"
environment = "production"
image = "belegost"
tag_http = "http"
tag_ssh = "ssh"
tag_icmp = "icmp"
tag_sinatra = "sinatra"

# Healthcheck Vars
name_health_check = "apery-healthcheck"
check_interval_sec = "5"
timeout_sec = "5"
healthy_threshold = "2"
unhealthy_threshold = "2"
request_path = "/status"

# External IP
ip_name = "apery-ip"

# Load Balance
lb_name = "apery-lb"
http_proxy = "apery-http-proxy"
backend_name = "apery-backend"
port_name = "http"
protocol = "HTTP"
forwarding_rule = "apery-frontend-http"