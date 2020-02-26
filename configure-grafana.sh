./generate-cluster-connection-yaml.sh

# obtain the password
PASSWORD=`kubectl -n monitoring get secret grafana -o jsonpath='{.data.admin-password}' --kubeconfig ./kubeconfig.yaml | base64 -d`

# obtain the prometheus public IP
GRAFANA_PUBLIC_IP=`kubectl -n monitoring get services -o=jsonpath='{$.items[0].status.loadBalancer.ingress[0].ip}' --kubeconfig ./kubeconfig.yaml`

# obtain the prometheus public IP
PROMETHEUS_CLUSTER_IP=`kubectl -n monitoring get services -o=jsonpath='{$.items[1].spec.clusterIP}' --kubeconfig ./kubeconfig.yaml`

echo 'Prometheus service ClusterIP' $PROMETHEUS_CLUSTER_IP

GRAFANA_URL=http://nichemley:$PASSWORD@$GRAFANA_PUBLIC_IP:8080

# test connection
echo 'Testing Connection: ' $GRAFANA_URL/api/org
curl $GRAFANA_URL/api/org
echo ""

# configure the datasource
curl $GRAFANA_URL/api/datasources --header "Content-Type: application/json" --request POST -d @- <<DATA
{
  "name":"prometheus",
  "type":"prometheus",
  "url":"http://$PROMETHEUS_CLUSTER_IP:8080",
  "access":"proxy",
  "basicAuth":false
}
DATA
