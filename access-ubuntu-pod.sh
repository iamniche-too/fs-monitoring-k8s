#!/bin/bash
source ./export-gcp-credentials.sh
./generate-cluster-connection-yaml.sh

kubectl -n monitoring run my-shell --rm -i --tty --image ubuntu --kubeconfig ./kubeconfig.yaml -- /bin/bash
