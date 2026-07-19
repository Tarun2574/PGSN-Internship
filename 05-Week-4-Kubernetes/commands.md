# Week 4 – Command Reference

Every `kubectl` and `helm` command that is actually visible in the 42 screenshots, grouped by day. Commands are transcribed as typed; no commands have been added beyond what appears on-screen.

## Day 1 — Pod Basics

```
kubectl describe pod nginx-pod
kubectl logs nginx-pod
kubectl exec -it nginx-pod -- /bin/bash
ls
pwd
exit
kubectl get pod nginx-pod -o wide
kubectl get pod nginx-pod -o yaml
kubectl delete pod nginx-pod
kubectl get pods
```

## Day 2 — Deployments & Services

```
kubectl create deployment nginx-deployment --image=nginx
kubectl scale deployment nginx-deployment --replicas=3
kubectl get deployments
kubectl get pods
kubectl expose deployment nginx-deployment --type=NodePort --port=80
kubectl get services
kubectl describe service nginx-deployment
kubectl scale deployment nginx-deployment --replicas=5
kubectl get deployment
kubectl set image deployment/nginx-deployment nginx=nginx:1.27
kubectl rollout status deployment/nginx-deployment
kubectl delete pod nginx-deployment-<hash>
kubectl get pods -w
```

## Day 3 — ConfigMaps, Secrets, Storage

```
notepad configmap.yaml
kubectl apply -f configmap.yaml
kubectl get configmap
kubectl describe configmap app-config
notepad secret.yaml
dir
kubectl apply -f secret.yaml
kubectl get secrets
kubectl describe secret app-secret
notepad pod.yaml
dir
kubectl apply -f pod.yaml
kubectl get pods
kubectl exec -it config-secret-pod -- /bin/sh
printenv APP_NAME
printenv APP_ENV
printenv USERNAME
printenv PASSWORD
exit
kubectl get pv
notepad storage-pod.yaml
kubectl apply -f .\storage-pod.yaml
kubectl get pods
kubectl exec -it storage-pod -- /bin/sh
echo "Kubernetes Storage Test" > /usr/share/nginx/html/data/test.txt
exit
kubectl exec -it storage-pod -- cat /usr/share/nginx/html/data/test.txt
```

## Day 4 — Ingress & Networking

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/.../deploy.yaml   # (inferred from resource-creation output; exact URL not visible on-screen)
kubectl get pods -n ingress-nginx
kubectl create deployment nginx2 --image=nginx
kubectl scale deployment nginx2 --replicas=2
kubectl get deployments
kubectl expose deployment nginx-deployment --port=80 --target-port=80 --name=nginx-service
kubectl expose deployment nginx2 --port=80 --target-port=80 --name=nginx2-service
kubectl get svc
# Browser: http://localhost:8080/app1
# Browser: http://localhost:8080/app2
```

> No `kubectl get ingress` / `kubectl describe ingress` / `kubectl apply -f ingress.yaml` command is visible in any screenshot — only the controller install and the resulting browser behavior were captured.

## Day 5 — Resource Limits & Probes

```
cd C:\k8s-labs
pwd
notepad resource-deployment.yaml
kubectl apply -f resource-deployment.yaml
kubectl get deployment
kubectl get pods
kubectl describe pod probe-demo
kubectl exec -it probe-demo -- /bin/sh
kill 1
kubectl get pods -w
kubectl logs probe-demo --previous
```

## Day 6 — Helm

```
helm version
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo nginx
helm install my-nginx bitnami/nginx
helm list
kubectl get pods
kubectl get svc
cd C:\k8s-labs
helm create mychart
dir
helm lint .\mychart
helm install my-custom-app .\mychart
notepad .\mychart\values.yaml   # (inferred: values were edited between install and upgrade to change replica count)
helm upgrade my-custom-app .\mychart
kubectl get deployment
kubectl get pods
```

> No `helm rollback` or `helm history` command is visible in any screenshot.

## Day 7 — Cleanup (end of session)

```
Write-Host "===== Uninstalling Helm Releases ====="
helm uninstall my-custom-app 2>$null
helm uninstall my-nginx 2>$null
Write-Host "===== Deleting Kubernetes Resources ====="
kubectl delete ingress --all --ignore-not-found
kubectl delete deployment --all --ignore-not-found
kubectl delete replicaset --all --ignore-not-found
kubectl delete service --all --ignore-not-found
kubectl delete pod --all --ignore-not-found
kubectl delete configmap --all --ignore-not-found
kubectl delete secret --all --ignore-not-found
kubectl delete pvc --all --ignore-not-found
kubectl delete pv --all --ignore-not-found
kubectl delete networkpolicy --all --ignore-not-found
Write-Host "===== Remaining Resources ====="
kubectl get all
```

> All `kubectl delete`/`kubectl get all` commands in this cleanup script **failed** with `dial tcp 127.0.0.1:...: connection actively refused` — the Kubernetes cluster (Docker Desktop) had already been stopped by the time this script ran, so no resources were actually removed via these commands. The `helm uninstall` commands ran without visible error output (stderr suppressed via `2>$null`), so their success cannot be independently confirmed either — flagged as inconclusive rather than assumed successful.
