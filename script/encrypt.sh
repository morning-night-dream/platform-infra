#!/bin/bash -ue

env=$1

chart=$2

secret=$3

key=age1jglwyzrn80auhq0k93mv8zqn5ezt6ngsdvhjn23nwfh0quq7wussn2tdm3

if [[ -z "${secret}" ]]; then echo "Please specify secret"; exit 1; fi

yq -i "(del.sops)" ./charts/secret/env/${env}/${chart}/${secret}.yaml

yq -i ".data.${secret}=\"$(cat charts/secret/env/${env}/${chart}/${secret}.in.txt | base64)\"" charts/secret/env/${env}/${chart}/${secret}.yaml

sed -i .txt 's/"//g' charts/secret/env/${env}/${chart}/${secret}.yaml

rm charts/secret/env/${env}/${chart}/${secret}.yaml.txt

sops --encrypt \
	--age ${key} \
	--encrypted-regex '^(data|stringData)$$' \
	--in-place \
	charts/secret/env/${env}/${chart}/${secret}.yaml

yamlfmt charts/secret/env/${env}/${chart}/${secret}.yaml
