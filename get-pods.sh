#!/bin/bash
source ./export-gcp-credentials.sh
./generate-cluster-connection-yaml.sh

kubectl -n monitoring get pods -owide --kubeconfig ./kubeconfig.yaml
