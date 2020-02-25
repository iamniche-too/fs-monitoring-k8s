./generate-cluster-connection-yaml.sh

kubectl apply -f ./namespace.yaml -f ./cluster-role.yaml -f config-map.yaml -f ./prometheus-deployment.yaml -f ./prometheus-service.yaml -f ./grafana-deployment.yaml -f ./grafana-service.yaml --kubeconfig ./kubeconfig.yaml
