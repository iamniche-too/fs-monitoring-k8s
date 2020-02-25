./generate-cluster-connection-yaml.sh

kubectl -n monitoring get secret grafana -o jsonpath='{.data.admin-password}' --kubeconfig ./kubeconfig.yaml | base64 -d
