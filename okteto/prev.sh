#!/bin/sh -eu

helm upgrade --install --wait morning-night-dream-platform-app-core ./charts/app-core --namespace=prev-morning-night-dreamer

helm upgrade --install --wait morning-night-dream-platform-app-gateway ./charts/app-gateway --namespace=prev-morning-night-dreamer
