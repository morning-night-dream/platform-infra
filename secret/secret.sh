#!/bin/bash -ue

env=$1

chart=$2

secret=$3

cat << EOF > secret/env/${env}/${chart}/${secret}.yaml
apiVersion: v1
kind: Secret
metadata:
  name: platform-secret-${secret}
type: Opaque
data:
  ${secret}: ""
EOF

touch secret/env/${env}/${chart}/${secret}.in.txt

touch secret/env/${env}/${chart}/${secret}.out.txt
