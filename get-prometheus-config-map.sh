source ./export-gcp-credentials.sh
./generate-cluster-connection-yaml.sh

kubectl -n monitoring get cm prometheus-server-conf -oyaml --kubeconfig ./kubeconfig.yaml
