kubectl port-forward svc/prometheus 9090:9090 > /dev/null &
echo 'prometheus listened on localhost:9090'

kubectl port-forward svc/prometheus-test-backend 5000:5000 > /dev/null &
echo 'prometheus-test-backend listened on localhost:5000'

kubectl port-forward svc/prometheus-test-python 8000:8000 8001:8001 > /dev/null &
echo 'prometheus-test-python listened on localhost:8000 (metrics) and localhost:8001 (app)'

kubectl port-forward svc/grafana 3000:3000 > /dev/null &
echo 'grafana listened on localhost:3000'

echo 'Press Ctrc+C to exit and kill port-forward processes'

while true; do sleep 1; done

cleanup() {
  kill -KILL $(ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}')
}

trap cleanup EXIT

