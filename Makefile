include .secret.env
export

SHELL=/bin/bash

.PHONY: tool
tool:
	@aqua i

.PHONY: ymlfmt
ymlfmt:
	@yamlfmt

.PHONY: helmlint
helmlint:
	@helm lint charts/app-core
	@helm lint charts/app-gateway
	@helm lint charts/secret

.PHONY: tfmt
tfmt:
	@terraform fmt -recursive

.PHONY: tflint
tflint:
	@terraform fmt -recursive -check && \
	terraform validate

.PHONY: secret
secret:
	@script/secret.sh ${secret}

.PHONY: encrypt
encrypt:
	@script/encrypt.sh ${secret}

.PHONY: decrypt
decrypt:
	@script/decrypt.sh ${secret}
