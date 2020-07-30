source ./export-gcp-credentials.sh
./generate-cluster-connection-yaml.sh

PROMETHEUS_POD_NAME=`kubectl -n monitoring get pods -o jsonpath={'$.items[1].metadata.name'} --kubeconfig ./kubeconfig.yaml`
echo "Getting logs for $PROMETHEUS_POD_NAME"
kubectl -n monitoring logs $PROMETHEUS_POD_NAME --kubeconfig ./kubeconfig.yaml
