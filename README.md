# 🚀 TaskFlow - Smart Task Management Dashboard

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Flask](https://img.shields.io/badge/Flask-Web%20Framework-black)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF)

---

# 📖 Project Overview

TaskFlow is a cloud-native task management application developed as part of a Cloud & DevOps Internship Final Project.

The project demonstrates the complete deployment lifecycle of a modern web application using:

- Flask
- Docker
- Docker Hub
- Terraform
- AWS EC2
- Amazon EBS
- Kubernetes
- GitHub Actions

The same Docker image is deployed both on AWS EC2 and on a Kubernetes cluster, showcasing container portability and Infrastructure as Code (IaC).

---

# ✨ Features

- Add and view daily tasks
- Responsive Bootstrap dashboard
- Dockerized Flask application
- Automated deployment using EC2 User Data
- Persistent task storage using Amazon EBS
- Infrastructure provisioned using Terraform
- Kubernetes Deployment with 2 replicas
- NodePort Service
- ConfigMap
- Secret
- Persistent Volume & Persistent Volume Claim
- Horizontal Pod Autoscaler
- Network Policy
- Service Account
- Pod Disruption Budget
- CI/CD using GitHub Actions

---

# 🛠 Technology Stack

| Category | Technology |
|----------|------------|
| Language | Python |
| Framework | Flask |
| Frontend | HTML, CSS, Bootstrap 5 |
| Containerization | Docker |
| Registry | Docker Hub |
| Infrastructure | Terraform |
| Cloud | AWS EC2 |
| Storage | Amazon EBS |
| Orchestration | Kubernetes |
| CI/CD | GitHub Actions |

---

# 🏗 Architecture

```
Developer
     │
     ▼
 GitHub Repository
     │
     ▼
 GitHub Actions
     │
     ▼
 Docker Hub
     │
     ▼
 AWS EC2
 ├── Docker Container
 └── Amazon EBS
      │
      ▼
 TaskFlow Flask App
      │
      ▼
 Browser

──────────────────────────

Same Docker Image

        ▼

Kubernetes Deployment
      (2 Replicas)

        ▼

NodePort Service

        ▼

Browser
```

---

# 📁 Project Structure

```
TaskFlow/

├── app/
│   ├── app.py
│   ├── templates/
│   ├── static/
│   ├── data/
│   └── requirements.txt
│
├── Docker/
│   └── Dockerfile
│
├── terraform/
│   ├── providers.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── ebs.tf
│   ├── snapshot.tf
│   ├── terraform.tfvars
│   └── user_data.sh
│
├── k8s/
│
├── .github/
│   └── workflows/
│
├── architecture/
│
├── screenshots/
│
└── README.md
```

---

# ⚙ Prerequisites

- Python 3.x
- Docker Desktop
- Terraform
- AWS CLI
- kubectl
- Minikube or Kind
- Git

---

# ▶ Running Locally

```bash
pip install -r requirements.txt

python app.py
```

Open:

```
http://localhost:5000
```

---

# 🐳 Docker

Build Image

```bash
docker build -t taskflow .
```

Run Container

```bash
docker run -d -p 5000:5000 taskflow
```

---

# 🐳 Docker Hub

Image:

```
mtarunkumar/taskflow:latest
```

Pull Image

```bash
docker pull mtarunkumar/taskflow:latest
```

Run

```bash
docker run -d -p 5000:5000 mtarunkumar/taskflow:latest
```

---

# ☁ AWS Infrastructure

Terraform provisions:

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- Amazon EBS Volume
- EBS Snapshot

EC2 User Data automatically:

- Installs Docker
- Starts Docker
- Pulls the Docker image
- Mounts the EBS volume
- Runs the TaskFlow container

---

# ☸ Kubernetes Deployment

Resources deployed:

- Namespace
- Deployment (2 Replicas)
- Service
- ConfigMap
- Secret
- Persistent Volume
- Persistent Volume Claim
- Horizontal Pod Autoscaler
- Network Policy
- Service Account
- Pod Disruption Budget

---

# 🔄 CI/CD

GitHub Actions automatically:

- Builds Docker image
- Logs into Docker Hub
- Pushes latest image on every commit

---

# 📷 Screenshots

Include screenshots for:

- Project Structure
- Local Application
- Docker Build
- Docker Desktop
- Docker Hub Repository
- Terraform Apply
- AWS VPC
- EC2 Instance
- EBS Volume
- Snapshot
- Browser on EC2
- Kubernetes Pods
- Kubernetes Services
- NodePort Application
- GitHub Actions

---

# 🚀 Deployment Workflow

1. Develop the Flask application.
2. Build a Docker image.
3. Push the image to Docker Hub.
4. Provision AWS infrastructure using Terraform.
5. EC2 User Data installs Docker and starts the application.
6. Persist task data on an attached EBS volume.
7. Deploy the same image to Kubernetes.
8. Expose the application using a NodePort Service.
9. Automate Docker builds with GitHub Actions.

---

# 🎯 Learning Outcomes

- Docker Containerization
- Infrastructure as Code (Terraform)
- AWS Networking
- Amazon EC2 Deployment
- Amazon EBS Storage
- Kubernetes Fundamentals
- CI/CD using GitHub Actions
- Cloud Application Deployment

---

# ⚠ Challenges Faced

- Configuring Terraform resources
- Persisting application data using Amazon EBS
- Docker networking
- Kubernetes resource configuration
- GitHub Actions workflow debugging

---

# 🔮 Future Improvements

- Application Load Balancer
- Multi-AZ deployment
- AWS Systems Manager integration
- HTTPS using ACM and Load Balancer
- Domain name integration
- Monitoring and logging

---

# 👨‍💻 Author

**M Tarun Kumar**

Cloud & DevOps Internship Final Project