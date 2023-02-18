#!/bin/sh -eu

cp secret/env/prod/app-core/*.yaml charts/app-core/templates/secret/

helm upgrade --install --wait morning-night-dream-platform-app-core ./charts/app-core --namespace=toy-morning-night-dreamer

# cp secret/env/prod/app-api/*.yaml charts/app-api/templates/secret/

helm upgrade --install --wait morning-night-dream-platform-app-api ./charts/app-api --namespace=toy-morning-night-dreamer
