#!/bin/bash -ue

sops --decrypt charts/secret/templates/${secret}.yaml > charts/secret/templates/${secret}.tmp.yaml

yq ".data.${secret}" charts/secret/templates/${secret}.tmp.yaml | base64 -D > charts/secret/templates/${secret}.out.txt

rm charts/secret/templates/${secret}.tmp.yaml
