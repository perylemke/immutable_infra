.PHONY: build tests-app tests-infra init plan apply deploy destroy

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
plan:
	@$(MAKE) -s -C terraform plan

apply:
	@$(MAKE) -s -C terraform apply

deploy:
	@$(MAKE) -s -C terraform deploy

destroy:
	@$(MAKE) -s -C terraform destroy