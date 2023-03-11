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
	@for chart in $(find charts -type d -depth 1) ; do \
      helm lint ${chart}; \
    done

.PHONY: tfmt
tfmt:
	@terraform fmt -recursive

.PHONY: tflint
tflint:
	@terraform fmt -recursive -check && \
	terraform validate

.PHONY: secret
secret:
	@script/secret.sh ${env} ${chart} ${secret}

.PHONY: encrypt
encrypt:
	@script/encrypt.sh ${env} ${chart} ${secret}

.PHONY: decrypt
decrypt:
	@script/decrypt.sh ${env} ${chart} ${secret}

.PHONY: tfdev
tfdev:
	@(cd terraform && ENV=dev envsubst '$$ENV' < backend.tf.template > backend.tf)

.PHONY: tfinit
tfinit:
	@(cd terraform && terraform init)
