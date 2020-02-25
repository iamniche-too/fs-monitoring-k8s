GRAFANA_ADMIN_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 | tr -d '\n' | base64)

GRAFANA_ADMIN_PASSWORD_BASE64=`echo -n "$GRAFANA_ADMIN_PASSWORD" | base64`
GRAFANA_ADMIN_USERNAME_BASE64=`echo -n 'nichemley' | base64`

echo $GRAFANA_ADMIN_USERNAME_BASE64 | base64 -d
echo ""
echo $GRAFANA_ADMIN_PASSWORD_BASE64 | base64 -d
echo ""
echo "Writing out to grafana-secret.yaml..."
 
cat <<EOF > ./grafana-secret.yaml
# DO NOT EDIT - GENERATED FILE (see generate-grafana-secret.sh)
apiVersion: v1
kind: Secret
data:
  admin-username: $GRAFANA_ADMIN_USERNAME_BASE64
  admin-password: $GRAFANA_ADMIN_PASSWORD_BASE64
metadata:
  name: grafana
  namespace: monitoring
type: Opaque
EOF
