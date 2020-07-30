# fs-monitoring-k8s

Prometheus and Grafana are configured to deploy to producer nodes using a node affinity in the YAML.

To deploy to K8S:
```
$>./deploy.sh
```

Prometheus

To obtain the external IP:

Run ./get-services.sh to obtain External IP for Prometheus.

See http://<prometheus-external-ip>:8080

Grafana

Obtain the external IP using the same process as above.

The grafana user/password is on the console when deployed.

Resources

Kafka metrics JSON from https://raw.githubusercontent.com/softwaremill/confluent-playground/master/metrics/kafka/ApacheKafkaBrokerMetrics.json
