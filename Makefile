include .secret.env
export

SHELL=/bin/bash

.PHONY: tool
tool:
	@aqua i

.PHONY: chart
chart:
	@(cd charts && helm create ${chart})

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
	@secret/secret.sh ${env} ${secret}

.PHONY: encrypt
encrypt:
	@secret/encrypt.sh ${env} ${secret}

.PHONY: decrypt
decrypt:
	@secret/decrypt.sh ${env} ${secret}

.PHONY: tfdev
tfdev:
	@(cd terraform && ENV=dev envsubst '$$ENV' < backend.tf.template > backend.tf)

.PHONY: tfinit
tfinit:
	@(cd terraform && terraform init)
