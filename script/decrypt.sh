#!/bin/bash -ue

env=$1

chart=$2

secret=$3

sops --decrypt charts/secret/env/${env}/${chart}/${secret}.yaml > charts/secret/env/${env}/${chart}/${secret}.tmp.yaml

yq ".data.${secret}" charts/secret/env/${env}/${chart}/${secret}.tmp.yaml | base64 -D > charts/secret/env/${env}/${chart}/${secret}.out.txt

rm charts/secret/env/${env}/${chart}/${secret}.tmp.yaml
