# AWS Internship – Documentation Repository

This repository documents hands-on AWS Cloud Engineering work completed during an ongoing internship. It covers compute, networking, storage, high availability, security, Infrastructure-as-Code, containerization, and CI/CD — built and verified incrementally, week by week.

> **Status:** This internship is in progress. This repository currently documents **Week 2**, **Week 2 Extension**, and **Week 3**. Additional weeks will be added as they are completed.

## Repository Structure

```
AWS-Internship/
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

Each task/day folder contains its own `README.md` (and `Commands.md` where CLI commands were used), following a consistent format: Overview, Objectives, AWS Services Used, Prerequisites, Implementation, Verification, Challenges & Troubleshooting, Key Learnings, Result, Skills Demonstrated, Commands Used, Screenshot References, and Conclusion.

## Weekly Summaries

### [Week 2 – AWS Fundamentals: Compute, Networking & Storage](./Week-2/README.md)
Launched an EC2 web server, built a custom VPC with public/private subnets and NAT/Internet Gateways, and explored both S3 (static hosting) and EBS (attached volume + snapshot) storage.

### [Week 2 Extension – Advanced AWS Networking, Compute & Storage](./Week-2-Extension/README.md)
Extended the Week 2 environment to multi-AZ, added an Application Load Balancer and Auto Scaling Group, locked down private instances behind a Bastion Host, layered on S3 versioning/lifecycle rules, and enabled VPC Flow Log monitoring.

### [Week 3 – Infrastructure as Code, Containerization & CI/CD](./Week-3/README.md)
Moved from manual console work to Terraform-managed infrastructure (with modules and a remote S3 backend), containerized the application with Docker, automated builds with GitHub Actions, deployed via Terraform, and added CloudWatch monitoring.

## Architecture

A full architecture diagram covering the networking, compute, storage, and monitoring layers built across Week 2 and Week 2 Extension is available in [`Assets/Architecture_Diagram.jpg`](./Assets/Architecture_Diagram.jpg), and is also included directly in [Task 2.4](./Week-2/Task-2.4-Architecture-Diagram/README.md) and [Week 2 Extension Day 7](./Week-2-Extension/Day-7-Architecture-Documentation/README.md).

## Notes on Documentation Scope

- Screenshots were curated down to the clearest evidence for each step; duplicate, blank, or low-value screenshots were excluded rather than included for volume.
- Every command listed in a `Commands.md` file was observed directly in a screenshot — no commands were invented.
- Where a deliverable (e.g., a dedicated Task 2.4 diagram) had no distinct screenshot of its own, the closest available evidence was reused and explicitly noted as such rather than fabricated.
