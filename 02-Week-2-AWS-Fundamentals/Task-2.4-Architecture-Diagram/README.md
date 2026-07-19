# Task 2.4 – Architecture Diagram

## Overview
This task documents the overall AWS infrastructure built across Week 2 in a single architecture diagram, tying together the EC2 web server, custom VPC networking, and S3/EBS storage work into one visual reference.

> **Note:** The diagram below is the same architecture diagram produced for **Week 2 Extension, Day 7 – Architecture Documentation**, since it was the only architecture diagram available in the source material and its content (VPC, subnets, Load Balancer, Auto Scaling, Bastion Host) documents the fuller environment built by the end of Week 2 Extension. It is included here as well so that Week 2's documentation is self-contained.

## Objectives
- Document the AWS infrastructure built during the internship
- Explain traffic flow through the environment
- Provide a visual (Draw.io-style) architecture diagram

## AWS Services Used
- Amazon VPC, Subnets, Internet Gateway, NAT Gateway
- Amazon EC2 (Bastion Host, application instances)
- Application Load Balancer, Auto Scaling Group
- Amazon S3, Amazon CloudWatch, VPC Flow Logs, Gateway VPC Endpoint

## Implementation
The diagram maps the AWS Cloud → Region → VPC → Availability Zone hierarchy, showing:
- A **public subnet** in each of two Availability Zones, each containing a Bastion Host and participating in Application Load Balancer routing
- A **private subnet** in each Availability Zone, containing the application EC2 instances with attached EBS volumes/snapshots
- Traffic flow: an administrator connects over SSH to the Bastion Host, while public internet traffic enters through the Internet Gateway and is distributed by the Application Load Balancer to EC2 instances in the private subnets
- A **NAT Gateway** providing outbound internet access for the private subnets
- A **Gateway VPC Endpoint** giving private instances access to Amazon S3 without traversing the public internet
- **VPC Flow Logs** and **CloudWatch** monitoring the environment

## Traffic Flow Explanation
1. The administrator's laptop connects via SSH to the Bastion Host in the public subnet.
2. End-user/public traffic enters through the Internet Gateway and is routed to the Application Load Balancer.
3. The Application Load Balancer distributes traffic across EC2 instances running in the private subnets (managed by an Auto Scaling Group).
4. Private EC2 instances reach the internet outbound (e.g., for package updates) through the NAT Gateway.
5. Private EC2 instances access S3 directly and privately through the Gateway VPC Endpoint.
6. VPC Flow Logs and CloudWatch capture network and application metrics for monitoring.

## Result
A single reference diagram that documents the full Week 2 / Week 2 Extension network and traffic flow, used as the basis for design discussion and troubleshooting throughout the internship.

## Skills Demonstrated
- Cloud architecture diagramming
- Ability to explain multi-tier network traffic flow
- Documentation of infrastructure decisions

## Screenshot References
| # | File | Description |
|---|---|---|
| 1 | `01_Architecture_Diagram.jpg` | Full AWS architecture diagram covering networking, compute, storage, and monitoring |

## Conclusion
This diagram consolidates every AWS resource built during Week 2 and its extension into one coherent picture, making the environment easy to reason about and easy to hand off or present.
