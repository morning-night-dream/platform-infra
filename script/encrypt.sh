#!/bin/bash -ue

secret=$1

key=age1jglwyzrn80auhq0k93mv8zqn5ezt6ngsdvhjn23nwfh0quq7wussn2tdm3

if [[ -z "${secret}" ]]; then echo "Please specify secret"; exit 1; fi

yq -i "(del.sops)" ./charts/secret/templates/${secret}.yaml

yq -i ".data.${secret}=\"$(cat charts/secret/templates/${secret}.in.txt | base64)\"" charts/secret/templates/${secret}.yaml

sed -i .txt 's/"//g' charts/secret/templates/${secret}.yaml

rm charts/secret/templates/${secret}.yaml.txt

sops --encrypt \
	--age ${key} \
	--encrypted-regex '^(data|stringData)$$' \
	--in-place \
	charts/secret/templates/${secret}.yaml

yamlfmt charts/secret/templates/${secret}.yaml
