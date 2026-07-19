# DevPulse Multi-Platform Deployment Architecture

`mermaid
flowchart TD
    A[DevPulse Web App<br/>HTML + CSS + JavaScript] --> B[Dockerfile]
    B --> C[Docker Image<br/>mtarunkumar/devpulse-portfolio:latest]

    C --> D[AWS EC2 Deployment]
    D --> E[Terraform]
    E --> F[EC2 Instance]
    F --> G[Docker Container<br/>Port 80]
    G --> H[EC2 Public IP<br/>DevPulse Application]

    C --> I[Kubernetes Deployment]
    I --> J[Pod Replica 1]
    I --> K[Pod Replica 2]
    J --> L[NodePort Service<br/>80:30080]
    K --> L
    L --> M[Local Access<br/>localhost:8080]

