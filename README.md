*** TROUBLESHOOTING ***

Minikube:
1) Some of the pods stuck in "Pending" state
Default minikube resources limits (2 cpus and 2048Mb memory) may not be enouth to launch all repo's pods.
In this case you will see that some of the pods stuck in "Pending" state and has Warning event "Insufficient cpu"
To fix the problem you can simply add more resources to minikube with following commands
```
minikube config set cpus 4
minikube config set memory 4096
minikube stop & minikube delete
```
Now you can restart you minikube cluster and try again

2) Prometheus is unable to retrieve metrics from kubelet or cAdvisor
Reason way lay within k8s authorization. In this case try to start minikube with the following settings
```
--extra-config=kubelet.authentication-token-webhook=true
--extra-config=kubelet.authorization-mode=Webhook minikube flags
```
These flags will change default kubelet settings to NOT validate tls sertificates

3) Enable ingress
