./generate-cluster-connection-yaml.sh

# obtain the password
PASSWORD=`kubectl -n monitoring get secret grafana -o jsonpath='{.data.admin-password}' --kubeconfig ./kubeconfig.yaml | base64 -d`

# obtain the grafana public IP
GRAFANA_PUBLIC_IP=`kubectl -n monitoring get services -o=jsonpath='{$.items[0].status.loadBalancer.ingress[0].ip}' --kubeconfig ./kubeconfig.yaml`

echo 'Grafana service ClusterIP' $GRAFANA_PUBLIC_IP

# obtain the prometheus public IP
PROMETHEUS_CLUSTER_IP=`kubectl -n monitoring get services -o=jsonpath='{$.items[1].spec.clusterIP}' --kubeconfig ./kubeconfig.yaml`

echo 'Prometheus service ClusterIP' $PROMETHEUS_CLUSTER_IP

GRAFANA_URL=$GRAFANA_PUBLIC_IP:8080
echo "Grafana URL: http://$GRAFANA_URL/api/org"
CREDENTIALS=nichemley:$PASSWORD
echo "Credentials: $CREDENTIALS"

# test connection
echo 'Testing Connection using credentials: ' http://$CREDENTIALS@$GRAFANA_URL/api/org
curl http://$CREDENTIALS@$GRAFANA_URL/api/org
echo ""

# configure the datasource
curl http://$CREDENTIALS@$GRAFANA_URL/api/datasources --header "Content-Type: application/json" --request POST -d @- <<DATA
{
  "name":"prometheus",
  "type":"prometheus",
  "url":"http://$PROMETHEUS_CLUSTER_IP:8080",
  "access":"proxy",
  "basicAuth":false
}
DATA

echo ""
