export GOOGLE_APPLICATION_CREDENTIALS=./terraform-test-262517-b4ff2f611b21.json
./generate-cluster-connection-yaml.sh

<<<<<<< HEAD
kubectl apply -f ./namespace.yaml -f ./cluster-role.yaml -f config-map.yaml -f ./prometheus-deployment.yaml -f ./prometheus-service.yaml --kubeconfig ./kubeconfig.yaml
=======
kubectl apply -f ./namespace.yaml -f ./cluster-role.yaml -f ./prometheus-deployment.yaml -f ./prometheus-service.yaml --kubeconfig ./kubeconfig.yaml
>>>>>>> f05217af5471a5482911273f25a9efc642b0c831
