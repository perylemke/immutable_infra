output "allow_ssh_fw_self_link" { value = "${google_compute_firewall.ssh.self_link}" }
output "allow_ssh_fw_id" { value = "${google_compute_firewall.ssh.id}" }
output "allow_icmp_fw_self_link" { value = "${google_compute_firewall.icmp.self_link}" }
output "allow_icmp_fw_id" { value = "${google_compute_firewall.icmp.id}" }
output "allow_http_https_fw_self_link" { value = "${google_compute_firewall.http-https.self_link}" }
output "allow_http_https_fw_id" { value = "${google_compute_firewall.http-https.id}" }