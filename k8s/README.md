# TaskFlow Kubernetes Deployment

## Deployment Components

- Namespace
- ConfigMap
- Secret
- Persistent Volume
- Persistent Volume Claim
- Deployment
- Service
- Ingress
- Horizontal Pod Autoscaler
- Network Policy


## Apply Resources

Create namespace and resources:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f persistent-volume.yaml
kubectl apply -f persistent-volume-claim.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
kubectl apply -f hpa.yaml
kubectl apply -f network-policy.yaml
Verify Deployment

Check namespace:

kubectl get namespace

Check pods:

kubectl get pods -n taskflow

Check services:

kubectl get svc -n taskflow

Check deployment:

kubectl get deployment -n taskflow

Check HPA:

kubectl get hpa -n taskflow
Access Application

Using NodePort:

http://localhost:30080

Using Minikube:

minikube service taskflow-service -n taskflow
Architecture
User
 |
 v
Kubernetes Service
 |
 v
TaskFlow Pods (2 Replicas)
 |
 v
Flask Application
 |
 v
Persistent Volume
 |
 v
Task Data
Docker Image
mtarunkumar/taskflow:latest
Namespace
taskflow