SHELL=/bin/bash

export
ENV := dev

.PHONY: tool
tool:
	@aqua i

.PHONY: ymlfmt
ymlfmt:
	@yamlfmt

AGE_PUBLIC_KEY=age1jglwyzrn80auhq0k93mv8zqn5ezt6ngsdvhjn23nwfh0quq7wussn2tdm3

.PHONY: encrypt
encrypt:
	@if [ -z "${SECRET_FILE_NAME}" ]; then echo "Please specify SECRET_FILE_NAME"; exit 1; fi	
	@yq -i "(del.sops)" k8s/templates/${SECRET_FILE_NAME}
	@sops --encrypt \
		--age ${AGE_PUBLIC_KEY} \
		--encrypted-regex '^(data|stringData)$$' \
		--in-place \
		k8s/templates/${SECRET_FILE_NAME}
	@yamlfmt k8s/templates/${SECRET_FILE_NAME}

.PHONY: decrypt
decrypt:
	@sops --decrypt --in-place k8s/templates/${SECRET_FILE_NAME}

.PHONY: tfmt
tfmt:
	@terraform fmt -recursive

.PHONY: tflint
tflint:
	@terraform fmt -recursive -check && \
	terraform validate
