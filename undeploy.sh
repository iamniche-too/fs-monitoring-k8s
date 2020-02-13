export GOOGLE_APPLICATION_CREDENTIALS=./terraform-test-262517-b4ff2f611b21.json
./generate-cluster-connection-yaml.sh

kubectl delete clusterrole prometheus --kubeconfig ./kubeconfig.yaml
kubectl delete clusterrolebinding prometheus --kubeconfig ./kubeconfig.yaml
kubectl delete ns monitoring --kubeconfig ./kubeconfig.yaml
