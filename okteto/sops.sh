#!/bin/sh -eu

SOPS_VERSION=3.7.3

uname -a

apt-get install wget > /dev/null

wget --quiet https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64

mv sops-v${SOPS_VERSION}.linux.amd64 sops

chmod +x sops

# シークレットの復号化
./sops --decrypt --in-place charts/secret/api-key.yaml

./sops --decrypt --in-place charts/secret/database-url.yaml

./sops --decrypt --in-place charts/secret/redis-url.yaml

./sops --decrypt --in-place charts/secret/firebase-api-key.yaml

./sops --decrypt --in-place charts/secret/firebase-secret.yaml
