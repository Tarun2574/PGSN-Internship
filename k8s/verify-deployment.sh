#!/bin/bash

echo "Checking TaskFlow Kubernetes Deployment..."

echo ""

echo "Namespaces:"
kubectl get namespace taskflow


echo ""

echo "Pods:"
kubectl get pods -n taskflow


echo ""

echo "Services:"
kubectl get services -n taskflow


echo ""

echo "Deployments:"
kubectl get deployments -n taskflow


echo ""

echo "Persistent Volumes:"
kubectl get pv


echo ""

echo "Persistent Volume Claims:"
kubectl get pvc -n taskflow


echo ""

echo "Horizontal Pod Autoscaler:"
kubectl get hpa -n taskflow


echo ""

echo "TaskFlow deployment verification completed."