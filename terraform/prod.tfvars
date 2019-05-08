# General Vars
project = "devopsfloripa-demo"
region = "us-central1"
zone = "us-central1-c"

# Autoscaler Vars
max_replicas = 3
min_replicas = 1
cooldown_period = 60
target_cpu = 0.8

# Instance Group Vars
target_size = 1
port_api_name = "http"
port_api_number = 80
type_update = "PROACTIVE"
minimal_action = "REPLACE"
max_surge_fixed = 1
max_unavailable_fixed = 0
min_ready_sec = 0
initial_delay_sec = 50

# Template Instance Vars
machine_type = "g1-small"
environment = "prod"
image = "belegost"

# Healthcheck Vars
check_interval_sec = "5"
timeout_sec = "5"
healthy_threshold = "2"
unhealthy_threshold = "2"
request_path = "/status"

# Load Balance
protocol = "HTTP"

# Firewall
ssh_port = ["22"]
http_https_port = ["80", "443"]
tag_ssh = "ssh"
tag_icmp = "icmp"
tag_http_https = "http-https"