.PHONY: build init plan production create-infra deploy destroy

# Packer command
build:
	packer build packer/belegost.json

# App tests command
tests-app:
	@cd src && pip install -r requirements.txt && python -m pytest

# Molecule Tests
tests-infra:
	@cd ansible && molecule test

# Terraform -> General Command
init:
	@$(MAKE) -s -C terraform init

# Terraform -> Production Commands
plan-prod:
	@$(MAKE) -s -C terraform plan-prod

create-infra-prod:
	@$(MAKE) -s -C terraform create-infra-prod

deploy-prod:
	@$(MAKE) -s -C terraform deploy-prod

destroy-prod:
	@$(MAKE) -s -C terraform destroy-prod

# Terraform -> Staging Commands
plan-staging:
	@$(MAKE) -s -C terraform plan-staging

create-infra-staging:
	@$(MAKE) -s -C terraform create-infra-staging

deploy-staging:
	@$(MAKE) -s -C terraform deploy-staging

destroy-staging:
	@$(MAKE) -s -C terraform destroy-staging