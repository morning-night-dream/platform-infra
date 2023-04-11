#!/bin/sh -eu

helm upgrade --wait --namespace=toy-morning-night-dreamer --history-max 1 --version 1.11.3 -f ./flux/config.yaml flux okteto/flux
