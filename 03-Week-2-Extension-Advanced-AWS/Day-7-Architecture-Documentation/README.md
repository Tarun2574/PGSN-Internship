# Day 7 – Architecture Documentation

## Overview
This day consolidates everything built across Week 2 Extension (multi-AZ networking, load balancing, auto scaling, bastion access, advanced storage, and monitoring) into a single architecture diagram and traffic-flow explanation.

## Objectives
- Document the full Week 2 Extension AWS infrastructure
- Explain end-to-end traffic flow
- Explain the security model
- Explain how the environment scales

## AWS Services Used
- Amazon VPC, Subnets, Internet Gateway, NAT Gateway, Gateway VPC Endpoint
- Amazon EC2 (Bastion Host, application instances), Auto Scaling Group
- Application Load Balancer
- Amazon S3, Amazon CloudWatch, VPC Flow Logs

## Implementation
The final architecture diagram shows the complete environment:
- A VPC (`week2-vpc`, `10.0.0.0/16`) spanning two Availability Zones (`us-east-1a`, `us-east-1b`)
- **Public subnets** in each AZ hosting a Bastion Host and participating in Application Load Balancer routing
- **Private subnets** in each AZ hosting the application EC2 instances (managed by the Auto Scaling Group), each with attached EBS volumes and snapshots
- A **NAT Gateway** for private subnet outbound internet access
- A **Gateway VPC Endpoint** for private, direct S3 access
- **VPC Flow Logs** and **CloudWatch** providing monitoring across both the network and application layers

## Traffic Flow
1. **Administrative access**: Administrator laptop → SSH → Bastion Host (public subnet) → private application instances.
2. **Public/application traffic**: Internet → Internet Gateway → Application Load Balancer → target EC2 instances in the private subnets.
3. **Outbound traffic**: Private instances → NAT Gateway → Internet Gateway → internet (for updates, package installs, etc.).
4. **Storage traffic**: Private instances → Gateway VPC Endpoint → Amazon S3 (no public internet path required).
5. **Monitoring**: VPC Flow Logs and CloudWatch continuously capture network and instance-level metrics for both public and private subnets.

## Security Model
- No EC2 instance in the private subnets is directly reachable from the internet.
- All administrative access is funneled through the Bastion Host, whose own security group only accepts SSH from the administrator's IP.
- The Application Load Balancer is the only public entry point for application traffic.
- Security groups are scoped to reference other security groups (e.g., "allow SSH from Bastion SG") rather than open CIDR ranges.

## Scaling Model
- The Auto Scaling Group launches and terminates EC2 instances automatically based on demand, using the Day 2 launch template so every instance is configured identically.
- The Application Load Balancer automatically distributes traffic across all healthy instances in the target group, regardless of how many the Auto Scaling Group is currently running.

## Result
A single, presentable architecture diagram and written explanation that documents the complete Week 2 Extension environment — networking, compute, storage, security, and monitoring — suitable for onboarding, review, or portfolio presentation.

## Skills Demonstrated
- End-to-end cloud architecture documentation
- Ability to explain traffic flow, security posture, and scaling behavior together
- Diagramming using AWS architecture icon conventions

## Screenshot References
| # | File | Description |
|---|---|---|
| 1 | `01_Architecture_Diagram.jpg` | Complete Week 2 Extension architecture diagram |

## Conclusion
Day 7 ties together every piece built since Day 1 into one coherent, documented system — the natural checkpoint before moving into Week 3's Infrastructure-as-Code and CI/CD work, which will provision this same kind of environment automatically.
