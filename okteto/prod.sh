#!/bin/sh -eu

cp charts/secret/env/prod/app-core/*.yaml charts/app-core/templates/secret/

helm upgrade --install --wait morning-night-dream-platform-app-core ./charts/app-core --namespace=toy-morning-night-dreamer

# cp charts/secret/env/prod/app-gateway/*.yaml charts/app-gateway/templates/secret/

helm upgrade --install --wait morning-night-dream-platform-app-gateway ./charts/app-gateway --namespace=toy-morning-night-dreamer
