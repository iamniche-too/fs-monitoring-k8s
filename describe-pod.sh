export GOOGLE_APPLICATION_CREDENTIALS=./terraform-test-262517-b4ff2f611b21.json
./generate-cluster-connection-yaml.sh

PROMETHEUS_POD_NAME=`kubectl -n monitoring get pods -o jsonpath={'$.items[0].metadata.name'} --kubeconfig ./kubeconfig.yaml`
echo "Describe $PROMETHEUS_POD_NAME"
kubectl -n monitoring describe $PROMETHEUS_POD_NAME --kubeconfig ./kubeconfig.yaml
