# Week 4 – Deployment Guide

Reproducible step-by-step guide to redeploy everything captured in the Week 4 lab, based strictly on the manifests in [`manifests/`](./manifests) and the command sequence evidenced in the screenshots.

## 1. Prerequisites

- **Docker Desktop** with the Kubernetes checkbox enabled (Settings → Kubernetes → Enable Kubernetes)
- **kubectl** — bundled with Docker Desktop, or install separately and confirm it points at the `docker-desktop` context:
  ```
  kubectl config current-context
  kubectl cluster-info
  ```
- **Helm v3** — install via `winget install Helm.Helm` (Windows) or see helm.sh/docs/intro/install
  ```
  helm version
  ```

## 2. Basic Pod Lifecycle (Day 1)

```
kubectl run nginx-pod --image=nginx
kubectl get pods
kubectl describe pod nginx-pod
kubectl logs nginx-pod
kubectl exec -it nginx-pod -- /bin/bash
```
Clean up when done:
```
kubectl delete pod nginx-pod
```

## 3. Deployment & Service (Day 2)

```
kubectl create deployment nginx-deployment --image=nginx
kubectl scale deployment nginx-deployment --replicas=3
kubectl expose deployment nginx-deployment --type=NodePort --port=80
kubectl get svc nginx-deployment
```
Scale and update:
```
kubectl scale deployment nginx-deployment --replicas=5
kubectl set image deployment/nginx-deployment nginx=nginx:1.27
kubectl rollout status deployment/nginx-deployment
```
Roll back if needed (not exercised in this lab, but the command for reference):
```
kubectl rollout undo deployment/nginx-deployment
```
Verify self-healing:
```
kubectl delete pod <one-of-the-nginx-deployment-pods>
kubectl get pods -w
```

## 4. ConfigMap, Secret, Storage (Day 3)

From the `manifests/` folder:
```
kubectl apply -f manifests/configmap.yaml
kubectl apply -f manifests/secret.yaml
kubectl apply -f manifests/pod.yaml          # config-secret-pod
kubectl apply -f manifests/pv.yaml
kubectl apply -f manifests/pvc.yaml
kubectl apply -f manifests/storage-pod.yaml
```
Verify:
```
kubectl get configmap app-config
kubectl describe configmap app-config
kubectl get secret app-secret
kubectl exec -it config-secret-pod -- printenv APP_NAME APP_ENV USERNAME PASSWORD
kubectl get pv app-pv
kubectl get pvc app-pvc
kubectl exec -it storage-pod -- sh -c 'echo "Kubernetes Storage Test" > /usr/share/nginx/html/data/test.txt'
kubectl exec -it storage-pod -- cat /usr/share/nginx/html/data/test.txt
```

## 5. Ingress (Day 4)

Install the NGINX Ingress Controller (Docker Desktop / cloud-generic manifest):
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx -w
```
Create a second app and expose both as ClusterIP:
```
kubectl create deployment nginx2 --image=nginx
kubectl scale deployment nginx2 --replicas=2
kubectl expose deployment nginx-deployment --port=80 --target-port=80 --name=nginx-service
kubectl expose deployment nginx2 --port=80 --target-port=80 --name=nginx2-service
```
**Missing step:** an `Ingress` resource routing `/app1` → `nginx-service` and `/app2` → `nginx2-service` must exist for the browser test to work, but no `ingress.yaml` was captured or supplied. Recreate one, e.g.:
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /app1
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80
      - path: /app2
        pathType: Prefix
        backend:
          service:
            name: nginx2-service
            port:
              number: 80
```
Then apply it and verify: `kubectl get ingress`, then browse to `http://localhost:8080/app1` and `/app2`.

**Network Policies** were not attempted in this lab and are not included in this guide.

## 6. Resource Limits & Probes (Day 5)

```
kubectl apply -f manifests/resource-deployment.yaml
kubectl apply -f manifests/probe-pod.yaml
kubectl describe pod probe-demo
```
Trigger a liveness failure and confirm auto-recovery:
```
kubectl exec -it probe-demo -- kill 1
kubectl get pods -w
kubectl logs probe-demo --previous
```

## 7. Helm (Day 6)

Install a chart from a public repo:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install my-nginx bitnami/nginx
helm list
```
Create and deploy a custom chart:
```
helm create mychart
helm lint .\mychart
helm install my-custom-app .\mychart
# edit mychart/values.yaml (e.g. replicaCount) then:
helm upgrade my-custom-app .\mychart
helm list
```
Roll back (not exercised in this lab, included for completeness):
```
helm history my-custom-app
helm rollback my-custom-app 1
```

## 8. Cleanup

```
helm uninstall my-custom-app
helm uninstall my-nginx
kubectl delete all --all
kubectl delete configmap,secret,pvc,pv --all
```

**Troubleshooting note:** In the captured lab, the cleanup script was run *after* Docker Desktop's Kubernetes had already been stopped, producing `dial tcp 127.0.0.1:...: connection actively refused` for every `kubectl delete`/`kubectl get all` call. If you see this error, first confirm the cluster is running with `kubectl cluster-info` and restart Docker Desktop's Kubernetes if needed before retrying cleanup commands.
