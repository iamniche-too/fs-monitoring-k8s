#!/bin/bash
source ./export-gcp-credentials.sh
./generate-cluster-connection-yaml.sh

kubectl -n monitoring get services -owide --kubeconfig ./kubeconfig.yaml
