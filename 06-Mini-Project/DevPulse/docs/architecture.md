# DevPulse Multi-Platform Deployment Architecture

## Application Source

DevPulse Static Web Application
HTML + CSS + JavaScript
        |
        v
Dockerfile
        |
        v
Docker Image
mtarunkumar/devpulse-portfolio:latest
        |
        +-----------------------------+
        |                             |
        v                             v
   AWS EC2                      Kubernetes
   Deployment                    Deployment
        |                             |
   Docker Container              2 Replicas
        |                             |
   Port 80                    NodePort Service
        |                             |
        v                             v
EC2 Public IP                 Local Access
3.110.219.21                  localhost:8080


## Deployment Path 1 — AWS EC2

Terraform
    |
    v
AWS EC2 Instance
    |
    v
User Data Script
    |
    +--> Install Docker
    |
    +--> Pull Docker Image
    |
    +--> Run Container
    |
    v
DevPulse Application
http://3.110.219.21


## Deployment Path 2 — Kubernetes

Docker Hub Image
    |
    v
Kubernetes Deployment
    |
    +--> Pod Replica 1
    |
    +--> Pod Replica 2
    |
    v
NodePort Service
    |
    v
Port Forward
    |
    v
DevPulse Application
http://localhost:8080