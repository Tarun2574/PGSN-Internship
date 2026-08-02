# TaskFlow – Demo Script (5 Minutes)

## Introduction (30 seconds)

Good morning.

My name is M Tarun Kumar.

Today I will be demonstrating my Cloud & DevOps Internship Final Project called **TaskFlow**.

TaskFlow is a Dockerized Flask application that allows users to manage daily tasks. The project demonstrates complete cloud deployment using Docker, Terraform, AWS, Kubernetes, and GitHub Actions.

---

## Project Overview (30 seconds)

The project consists of:

- Flask Web Application
- Docker Container
- Docker Hub
- Terraform Infrastructure
- AWS EC2
- Amazon EBS
- Kubernetes Deployment
- GitHub Actions CI/CD

The same Docker image is deployed both on AWS EC2 and Kubernetes.

---

## Local Application Demo (45 seconds)

First, I developed the application locally using Flask.

The application allows users to:

- Add tasks
- View tasks
- Store task data

After verifying it locally, I containerized it using Docker.

---

## Docker Demonstration (45 seconds)

I created a Dockerfile for the application.

Then I:

- Built the Docker image
- Tested the container locally
- Pushed the image to Docker Hub

This image is later reused for AWS and Kubernetes deployment.

---

## AWS Deployment (1 minute)

Using Terraform, I provisioned:

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- Security Group
- EC2 Instance
- Amazon EBS Volume
- Snapshot

Using EC2 User Data:

- Docker is installed automatically.
- The Docker image is pulled from Docker Hub.
- The container starts automatically.
- The EBS volume is mounted for persistent task storage.

---

## Kubernetes Deployment (1 minute)

The same Docker image is deployed to Kubernetes.

Resources created include:

- Namespace
- Deployment
- Two Replicas
- NodePort Service
- ConfigMap
- Secret
- Persistent Volume
- Persistent Volume Claim
- Horizontal Pod Autoscaler
- Network Policy
- Service Account
- Pod Disruption Budget

This demonstrates scalability and high availability.

---

## GitHub Actions (30 seconds)

The project also includes GitHub Actions.

On every push:

- Docker image is built automatically.
- Image is pushed to Docker Hub.

This demonstrates a basic CI/CD pipeline.

---

## Conclusion (30 seconds)

Through this project I learned:

- Docker
- Terraform
- AWS
- Kubernetes
- GitHub Actions
- Infrastructure as Code
- Cloud Deployment

Thank you.