export GOOGLE_APPLICATION_CREDENTIALS=./terraform-test-262517-b4ff2f611b21.json
./generate-cluster-connection-yaml.sh

watch kubectl -n monitoring get pods --kubeconfig ./kubeconfig.yaml