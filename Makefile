include .secret.env
export

SHELL=/bin/bash

.PHONY: tool
tool:
	@aqua i

.PHONY: ymlfmt
ymlfmt:
	@yamlfmt

.PHONY: tfmt
tfmt:
	@terraform fmt -recursive

.PHONY: tflint
tflint:
	@terraform fmt -recursive -check && \
	terraform validate

.PHONY: encrypt
encrypt:
	@script/encrypt.sh ${secret}

.PHONY: decrypt
decrypt:
	@script/decrypt.sh ${secret}
