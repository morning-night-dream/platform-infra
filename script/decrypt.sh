#!/bin/bash -ue

secret=$1

sops --decrypt charts/secret/templates/${secret}.yaml > charts/secret/templates/${secret}.tmp.yaml

touch charts/secret/templates/${secret}.in.txt

yq ".data.${secret}" charts/secret/templates/${secret}.tmp.yaml | base64 -D > charts/secret/templates/${secret}.out.txt

rm charts/secret/templates/${secret}.tmp.yaml
