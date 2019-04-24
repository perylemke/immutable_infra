.PHONY: build init

build:
	@packer build packer/belegost.json

init:
	@$(MAKE) -s -C terraform init