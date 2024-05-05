SHELL=/bin/bash

include .env

.PHONY: help
help: ## display help section
	@ cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: deploy
deploy: prepare ## deploy to cf workers
	@ npx wrangler deploy

.PHONY: config-upload
config-upload:
	@ npx wrangler 

.PHONY: prepare
prepare: ## prepare developing environment
	@ sed -i -e "s/KV_BINDING/$(KV_BINDING)/" -e "s/KV_ID/$(KV_ID)/" wrangler.toml
