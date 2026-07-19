## 🧭 Overview

This repository documents my hands-on cloud and DevOps internship journey.

Each weekly folder contains detailed documentation of the tasks completed during the internship. Every task includes:

* Objectives
* AWS services and tools used
* Step-by-step implementation
* CLI commands where applicable
* Screenshots as evidence
* Troubleshooting notes
* Key learnings

The repository also includes a separate **Mini End-to-End App Deployment project** that combines the concepts learned throughout the internship into a complete application deployment workflow.

---

## 📊 Weekly Summary

### Week 1 — Cloud & Linux Foundations

Basic onboarding and foundational cloud learning tasks, including:

* Cloud Computing fundamentals
* SDLC concepts
* Linux fundamentals
* Shell scripting
* Git and GitHub

### Week 2 — AWS Fundamentals

* Deployed an EC2 web server
* Built a custom VPC with public and private subnets
* Configured Internet Gateway and NAT Gateway
* Worked with S3 and EBS storage services

### Week 2 Extension — Advanced AWS Architecture

* Designed a Multi-AZ architecture
* Configured an Application Load Balancer
* Implemented an Auto Scaling Group
* Configured a Bastion Host for secure access
* Implemented S3 versioning and lifecycle rules
* Configured VPC Flow Logs for monitoring

### Week 3 — DevOps & Infrastructure as Code

* Provisioned AWS infrastructure using Terraform
* Worked with Terraform variables, outputs, and resources
* Containerized applications using Docker
* Built and pushed Docker images
* Created GitHub Actions CI/CD pipelines
* Worked with CloudWatch monitoring and logging

### Week 4 — Kubernetes & Application Deployment

* Created Kubernetes Deployments
* Worked with Pods and ReplicaSets
* Configured Services and NodePort access
* Used ConfigMaps and Secrets
* Worked with Persistent Volumes and Persistent Volume Claims
* Deployed applications using Helm
* Practiced Kubernetes troubleshooting and application exposure

---

## 🚀 Mini Project — DevPulse End-to-End Deployment

The `Mini-Project/DevPulse/` directory contains a complete end-to-end deployment of the same application using multiple deployment approaches.

### Application

A simple static web application built with:

* HTML
* CSS
* JavaScript

The application is containerized using Docker and published to Docker Hub.

### Deployment Path 1 — Docker

```text
Application Source
        ↓
Dockerfile
        ↓
Docker Image
        ↓
Docker Hub
```

### Deployment Path 2 — AWS EC2 with Terraform

```text
Terraform
    ↓
AWS EC2 Instance
    ↓
User Data
    ↓
Docker Installation
    ↓
Docker Hub Image Pull
    ↓
Docker Container
    ↓
DevPulse Application
```

### Deployment Path 3 — GitHub Actions CI/CD

```text
Git Push
    ↓
GitHub Actions
    ↓
Docker Build
    ↓
Docker Hub Login
    ↓
Docker Image Push
```

### Deployment Path 4 — Kubernetes

```text
Docker Hub Image
        ↓
Kubernetes Deployment
        ↓
2 Pod Replicas
        ↓
NodePort Service
        ↓
DevPulse Application
```

The project demonstrates how the **same application can be deployed using Docker, AWS EC2, Terraform, GitHub Actions, and Kubernetes**.

---

## 🏗 Architecture

The repository includes architecture documentation and diagrams covering:

### AWS Architecture

* VPC networking design
* Public and private subnets
* EC2 compute layers
* Load Balancing
* Auto Scaling
* Bastion Host architecture
* S3 and EBS storage
* Monitoring and logging

### DevPulse Mini-Project Architecture

* Docker containerization
* Docker Hub image distribution
* Terraform-based EC2 deployment
* GitHub Actions CI/CD pipeline
* Kubernetes Deployment with 2 replicas
* NodePort Service
* Application access through EC2 and Kubernetes

---

## 📸 Evidence & Documentation

Screenshots are organized according to the project or weekly task they support.

The DevPulse mini-project contains evidence for:

* Docker image build
* Local container execution
* Terraform infrastructure provisioning
* EC2 application deployment
* GitHub Actions workflow execution
* Kubernetes deployment
* Two running replicas
* Kubernetes application access
* Final application demonstrations

Only meaningful screenshots are retained wherever possible to avoid unnecessary duplication.

---

## 📝 Notes

* Screenshots are curated to show meaningful execution steps.
* All CLI commands are real and executed during lab work.
* No fabricated outputs or steps are included.
* Terraform state files, provider binaries, and sensitive variable files are excluded from version control.
* The repository reflects practical hands-on experience with AWS, Docker, Terraform, GitHub Actions, and Kubernetes.

---

## 🚀 Status

📌 Active Internship Repository
📌 Weekly Tasks Completed and Documented
📌 Mini End-to-End Deployment Project Included
📌 Hands-on AWS + DevOps Learning Journey
📌 Continuously Updated
