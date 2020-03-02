kubectl delete ServiceAccount prometheus
kubectl delete ClusterRole prometheus
kubectl delete ClusterRoleBinding prometheus

kubectl delete Service kube-state-metrics
kubectl delete Deployment kube-state-metrics

helm delete prometheus-node-exporter --purge
helm delete prometheus-test-backend --purge
helm delete prometheus-test-python --purge
helm delete prometheus --purge
helm delete grafana --purge
