.PHONY: init plan apply deploy destroy

init:
	terraform init

# Production commands
plan:
	terraform workspace select prod
	terraform plan

apply:
	terraform workspace select prod
	terraform apply

deploy:
	terraform workspace select prod
	terraform state rm module.core.google_compute_instance_template.apery-template
	terraform apply -auto-approve

destroy:
	terraform workspace select prod
	terraform destroy
