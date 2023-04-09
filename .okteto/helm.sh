#!/bin/sh -eu

helm upgrade --install --wait morning-night-dream-platform-secret ./charts/secret --namespace=toy-morning-night-dreamer

helm upgrade --install --wait morning-night-dream-platform-database ./charts/database --namespace=toy-morning-night-dreamer

helm upgrade --install --wait morning-night-dream-platform-app-core ./charts/app-core --namespace=toy-morning-night-dreamer

helm upgrade --install --wait morning-night-dream-platform-app-api ./charts/app-api --namespace=toy-morning-night-dreamer
