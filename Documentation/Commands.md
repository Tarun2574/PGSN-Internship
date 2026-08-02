# Frequently Used Commands

------------------------------------------------------------------------

# 🐳 Docker

## Build Docker Image

``` bash
docker build -t taskflow .
```

## List Images

``` bash
docker images
```

## Run Container

``` bash
docker run -d -p 5000:5000 --name taskflow taskflow
```

## View Running Containers

``` bash
docker ps
```

## View All Containers

``` bash
docker ps -a
```

## Stop Container

``` bash
docker stop taskflow
```

## Remove Container

``` bash
docker rm taskflow
```

------------------------------------------------------------------------

# ☁️ Terraform

## Initialize Terraform

``` bash
terraform init
```

## Format Configuration

``` bash
terraform fmt
```

## Validate Configuration

``` bash
terraform validate
```

## Preview Infrastructure Changes

``` bash
terraform plan
```

## Create Infrastructure

``` bash
terraform apply
```

## Destroy Infrastructure

``` bash
terraform destroy
```

------------------------------------------------------------------------

# ☸️ Kubernetes

## Create Namespace

``` bash
kubectl apply -f namespace.yaml
```

## Deploy All Resources

``` bash
kubectl apply -f .
```

## View All Resources

``` bash
kubectl get all -n taskflow
```

## View Pods

``` bash
kubectl get pods -n taskflow
```

## View Services

``` bash
kubectl get svc -n taskflow
```

## Describe a Pod

``` bash
kubectl describe pod <pod-name> -n taskflow
```

## View Pod Logs

``` bash
kubectl logs <pod-name> -n taskflow
```

## Delete Resources

``` bash
kubectl delete -f .
```

------------------------------------------------------------------------

# 🌐 Git

## Check Repository Status

``` bash
git status
```

## Stage Changes

``` bash
git add .
```

## Commit Changes

``` bash
git commit -m "Finalize TaskFlow project"
```

## Push to GitHub

``` bash
git push origin master
```

------------------------------------------------------------------------

# 🔄 GitHub Actions

After pushing code:

1.  Open your GitHub repository.
2.  Go to the **Actions** tab.
3.  Verify the workflow completes successfully.
4.  Confirm the latest Docker image is available on Docker Hub.

------------------------------------------------------------------------

# 🌍 Application URLs

## Local

    http://localhost:5000

## AWS EC2

    http://13.234.29.105:5000

## Kubernetes (NodePort)

## Kubernetes (NodePort)

- **TaskFlow Application:** minikube service taskflow-service -n taskflow
- **TaskFlow Dashboard:** `http://<Node-IP>:30090`