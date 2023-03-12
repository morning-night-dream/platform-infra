#!/bin/bash -ue

env=$1

secret=$2

cat << EOF > secret/env/${env}/${secret}.yaml
apiVersion: v1
kind: Secret
metadata:
  name: platform-secret-${secret}
type: Opaque
data:
  ${secret}: ""
EOF

touch secret/env/${env}/${secret}.in.txt

touch secret/env/${env}/${secret}.out.txt
