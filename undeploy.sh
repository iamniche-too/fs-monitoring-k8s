./generate-cluster-connection-yaml.sh

kubectl delete clusterrole prometheus --kubeconfig ./kubeconfig.yaml
kubectl delete clusterrolebinding prometheus --kubeconfig ./kubeconfig.yaml
kubectl delete ns monitoring --kubeconfig ./kubeconfig.yaml
