./generate-cluster-connection-yaml.sh

kubectl -n monitoring describe pods --kubeconfig ./kubeconfig.yaml
