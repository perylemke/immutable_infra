.PHONY: init plan-prod create-infra-prod deploy-prod destroy-prod plan-staging create-infra-staging deploy-staging destroy-staging plan-dev create-infra-dev deploy-dev destroy-dev

init:
	terraform init

# Production commands
plan-prod:
	terraform workspace select prod
	terraform plan -var-file=prod.tfvars

create-infra-prod:
	terraform workspace select prod
	terraform apply -var-file=prod.tfvars

deploy-prod:
	terraform workspace select prod
	terraform state rm google_compute_instance_template.apery-template
	terraform apply -var-file=prod.tfvars -auto-approve

destroy-prod:
	terraform workspace select prod
	terraform destroy -var-file=prod.tfvars

# Staging Commands
plan-staging:
	terraform workspace select staging
	terraform plan -var-file=staging.tfvars

create-infra-staging:
	terraform workspace select staging
	terraform apply -var-file=staging.tfvars

deploy-staging:
	terraform workspace select staging
	terraform state rm google_compute_instance_template.apery-template
	terraform apply -var-file=staging.tfvars -auto-approve

destroy-staging:
	terraform workspace select staging
	terraform destroy -var-file=staging.tfvars
