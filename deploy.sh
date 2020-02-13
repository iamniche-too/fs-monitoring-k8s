export GOOGLE_APPLICATION_CREDENTIALS=./terraform-test-262517-b4ff2f611b21.json
./generate-cluster-connection-yaml.sh

kubectl apply -f ./namespace.yaml -f ./cluster-role.yaml -f ./prometheus-deployment.yaml -f ./prometheus-service.yaml --kubeconfig ./kubeconfig.yaml
