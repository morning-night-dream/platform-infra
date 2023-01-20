export
ENV := dev

.PHONY: fmt
fmt:
	@terraform fmt -recursive

.PHONY: lint
lint:
	@terraform fmt -recursive -check && \
	terraform validate

.PHONY: backend
backend:
	@envsubst '$$ENV' < backend.tf.template > backend.tf
