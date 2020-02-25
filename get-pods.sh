./generate-cluster-connection-yaml.sh

kubectl -n monitoring get pods --kubeconfig ./kubeconfig.yaml
