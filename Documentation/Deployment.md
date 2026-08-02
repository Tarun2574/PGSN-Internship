# Deployment Guide

## Local Deployment

```bash
pip install -r requirements.txt
python app.py
```

Open:

```
http://localhost:5000
```

---

## Docker

Build

```bash
docker build -t taskflow .
```

Run

```bash
docker run -d -p 5000:5000 taskflow
```

---

## Terraform

Initialize

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

## Kubernetes

Apply all manifests

```bash
kubectl apply -f k8s/
```

Verify

```bash
kubectl get all -n taskflow
```