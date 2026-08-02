# TaskFlow Viva Notes

## Project Title

TaskFlow - Smart Task Management Dashboard


---

# 1. Project Overview

TaskFlow is a cloud-native task management web application developed using Flask and deployed using modern DevOps technologies.

The project demonstrates:

- Application development
- Containerization
- Infrastructure as Code
- Cloud deployment
- CI/CD automation
- Kubernetes orchestration


---

# 2. Why Flask?

Flask is a lightweight Python web framework.

Advantages:

- Simple structure
- Fast development
- Easy integration with Docker
- Suitable for small and medium applications


---

# 3. Why Docker?

Docker packages the application and its dependencies into a container.

Benefits:

- Same environment everywhere
- Easy deployment
- Portable application
- Faster testing


---

# 4. Docker Workflow


Application Code

  |

  v

Dockerfile

  |

  v

Docker Image

  |

  v

Docker Container



---

# 5. Why Terraform?

Terraform is an Infrastructure as Code tool.

Used for:

- Creating AWS VPC
- Creating subnets
- Creating security groups
- Launching EC2 instance


Benefits:

- Automated infrastructure
- Version controlled setup
- Repeatable deployments


---

# 6. AWS Architecture

Components used:

## VPC

Provides isolated network environment.


## Public Subnet

Allows EC2 instance to communicate with internet.


## Private Subnet

Used for internal resources.


## Internet Gateway

Provides internet connectivity.


## EC2

Runs the TaskFlow Docker container.


---

# 7. CI/CD Pipeline Explanation

Pipeline:


Developer

|

GitHub Push

|

GitHub Actions

|

Docker Build

|

Docker Hub Push

|

Deployment



Advantages:

- Automated builds
- Reduces manual errors
- Faster delivery


---

# 8. Why Kubernetes?

Kubernetes manages containerized applications.

Features used:

- Deployment
- Replica management
- Service exposure
- Persistent storage


---

# 9. Kubernetes Components


## Deployment

Maintains application replicas.


## Pods

Smallest running unit containing containers.


## Service

Provides network access to pods.


## Persistent Volume

Stores application data permanently.


## HPA

Automatically scales pods based on CPU usage.


---

# 10. How Data Persistence Works

Without storage:


Container Deleted

    |

    v

Data Lost



With Persistent Volume:


Container

|

v

Persistent Volume

|

v

Data Remains Safe



---

# 11. Security

Implemented:

- Security Groups
- Network Policies
- Secrets
- Restricted access


---

# 12. Future Improvements

- AWS Load Balancer
- Database integration
- User authentication
- Monitoring with Prometheus
- Logging with ELK stack


---

# Final Explanation

TaskFlow demonstrates the complete DevOps lifecycle:

Code → Container → Cloud Infrastructure → CI/CD → Kubernetes Deployment