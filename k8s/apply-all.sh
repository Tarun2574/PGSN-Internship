#!/bin/bash

echo "Deploying TaskFlow Kubernetes Resources..."

kubectl apply -f namespace.yaml

kubectl apply -f configmap.yaml

kubectl apply -f secret.yaml

kubectl apply -f persistent-volume.yaml

kubectl apply -f persistent-volume-claim.yaml

kubectl apply -f service-account.yaml

kubectl apply -f rbac.yaml

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

kubectl apply -f hpa.yaml

kubectl apply -f network-policy.yaml

kubectl apply -f pod-disruption-budget.yaml


echo "TaskFlow deployment completed!"

echo ""

kubectl get all -n taskflow