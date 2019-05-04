.PHONY: build init plan production create-infra deploy destroy

build:
	packer build packer/belegost.json

init:
	@$(MAKE) -s -C terraform init

plan:
	@$(MAKE) -s -C terraform plan

create-infra:
	@$(MAKE) -s -C terraform create-infra

deploy:
	@$(MAKE) -s -C terraform deploy

destroy:
	@$(MAKE) -s -C terraform destroy

tests-app:
	@cd src && go test