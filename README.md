# AWS Internship – Documentation Repository

This repository documents hands-on AWS Cloud Engineering work completed during an ongoing internship. It covers compute, networking, storage, high availability, security, Infrastructure-as-Code, containerization, and CI/CD — built and verified incrementally, week by week.

> **Status:** This internship is in progress. This repository currently documents **Week 1**, **Week 2**, **Week 2 Extension**, and **Week 3**. Additional weeks will be added as they are completed.

## Repository Structure

```text
PGSN-Internship/
├── Week-1/
├── Week-2/
│   ├── Task-2.1-Web-Server-EC2/
│   ├── Task-2.2-Custom-VPC/
│   ├── Task-2.3-Storage-Exploration/
│   └── Task-2.4-Architecture-Diagram/
├── Week-2-Extension/
│   ├── Day-1-Multi-AZ-VPC/
│   ├── Day-2-Automated-EC2/
│   ├── Day-3-ALB-AutoScaling/
│   ├── Day-4-Bastion-Host/
│   ├── Day-5-Advanced-Storage/
│   ├── Day-6-Monitoring-FlowLogs/
│   └── Day-7-Architecture-Documentation/
├── Week-3/
│   ├── Day-1-Terraform-Fundamentals/
│   ├── Day-2-Terraform-Modules-Backend/
│   ├── Day-3-Docker-Fundamentals/
│   ├── Day-4-GitHub-Actions/
│   ├── Day-5-Deployment-Automation/
│   ├── Day-6-Monitoring-Logging/
│   └── Day-7-Final-Project/
├── Assets/
│   └── Architecture_Diagram.jpg
└── README.md
```

Each task/day folder contains its own `README.md` (and `Commands.md` where applicable), documenting objectives, implementation steps, AWS services used, verification, challenges, key learnings, commands, and screenshots.

## Weekly Summaries

### Week 1

Foundational internship activities and initial cloud learning tasks.

### Week 2 – AWS Fundamentals: Compute, Networking & Storage

Built an EC2 web server, created a custom VPC with public and private subnets, configured Internet and NAT Gateways, and explored Amazon S3 and Amazon EBS.

### Week 2 Extension – Advanced AWS Networking, Compute & Storage

Designed a Multi-AZ architecture, implemented an Application Load Balancer and Auto Scaling Group, configured Bastion Host access, enabled S3 versioning and lifecycle policies, and monitored traffic using VPC Flow Logs.

### Week 3 – Infrastructure as Code, Containerization & CI/CD

Provisioned infrastructure using Terraform, organized reusable modules, containerized applications with Docker, automated workflows using GitHub Actions, and configured monitoring with Amazon CloudWatch.

## Architecture

The repository includes architecture diagrams illustrating networking, compute, storage, and monitoring components built throughout the internship.

## Notes

* Screenshots have been curated to show the most relevant implementation evidence.
* Commands included in the documentation correspond to actual execution steps.
* Documentation reflects completed practical work and will continue to be updated as the internship progresses.
