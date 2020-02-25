./generate-cluster-connection-yaml.sh

kubectl -n monitoring get services --kubeconfig ./kubeconfig.yaml
