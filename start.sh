kubectl apply -f k8s/rbac-prometheus.yaml
kubectl apply -f k8s/kube-state-metrics.yaml

helm upgrade prometheus-node-exporter k8s/prometheus-node-exporter --install
helm upgrade prometheus-test-backend k8s/prometheus-test-backend --install
helm upgrade prometheus-test-python k8s/prometheus-test-python --install
helm upgrade prometheus k8s/prometheus --install
helm upgrade grafana k8s/grafana --install
