#!/bin/bash -ue

env=$1

secret=$2

sops --decrypt secret/env/${env}/${secret}.yaml > secret/env/${env}/${secret}.tmp.yaml

touch secret/env/${env}/${secret}.in.txt

yq ".data.${secret}" secret/env/${env}/${secret}.tmp.yaml | base64 -D > secret/env/${env}/${secret}.out.txt

rm secret/env/${env}/${secret}.tmp.yaml
