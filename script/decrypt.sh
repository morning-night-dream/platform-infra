#!/bin/bash -ue

env=$1

chart=$2

secret=$3

sops --decrypt secret/env/${env}/${chart}/${secret}.yaml > secret/env/${env}/${chart}/${secret}.tmp.yaml

yq ".data.${secret}" secret/env/${env}/${chart}/${secret}.tmp.yaml | base64 -D > secret/env/${env}/${chart}/${secret}.out.txt

rm secret/env/${env}/${chart}/${secret}.tmp.yaml
