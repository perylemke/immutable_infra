.PHONY: init create-infra plan deploy destroy

init:
	terraform init

plan:
	terraform plan -var-file=production.tfvars

create-infra:
	terraform workspace select production
	terraform apply -target=google_compute_autoscaler.apery-autoscaler -var-file=production.tfvars
	terraform apply -target=google_compute_global_forwarding_rule.apery-forwarding-rule -var-file=production.tfvars

deploy:
	terraform workspace select production
	terraform state rm google_compute_instance_template.apery-template
	terraform apply -target=google_compute_instance_template.apery-template -var-file=production.tfvars -auto-approve
	terraform apply -target=google_compute_instance_group_manager.apery-group -var-file=production.tfvars -auto-approve

destroy:
	terraform workspace select production
	terraform destroy -var-file=production.tfvars