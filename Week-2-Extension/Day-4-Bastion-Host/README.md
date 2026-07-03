# Day 4 – Bastion Host, Session Manager & Private Connectivity

## Overview
This day locks down direct access to private instances by introducing a Bastion Host as the single controlled entry point, and tightens the private instance's security group so it only accepts traffic from the bastion.

## Objectives
- Launch a Bastion Host in the public subnet
- Connect to a private EC2 instance through the Bastion Host
- Restrict the private instance's security group to only trust the Bastion Host

## AWS Services Used
- Amazon EC2 (Bastion Host, private instance)
- Security Groups

## Prerequisites
- The multi-AZ VPC with public/private subnets from Day 1
- A private EC2 instance already running in the private subnet

## Implementation
1. **Launched a Bastion Host instance** in the public subnet with a security group allowing inbound SSH only from the administrator's IP.
2. **Connected to the private EC2 instance** by first SSH-ing into the Bastion Host, then hopping from the bastion to the private instance's internal IP.
3. **Restricted the private instance's security group** so inbound SSH (22) and HTTP (80) are only permitted from the Bastion Host's security group — not from any public IP.

## Verification
- The bastion host instance details confirmed it was correctly placed in the public subnet with a public IP assigned.
- A successful SSH session was established end-to-end: administrator → Bastion Host → private EC2 instance.
- The private instance's security group inbound rules showed sources scoped to the **bastion security group ID** rather than an open CIDR range, confirming least-privilege access.

## Challenges & Troubleshooting
- The private instance was initially unreachable directly from the administrator's machine (expected, by design) — this confirmed the private subnet has no route to the internet for inbound traffic and access must go through the bastion.

## Key Learnings
- Why a Bastion Host pattern is preferred over exposing every instance to the internet: it creates a single, auditable point of entry.
- How to scope a security group's source to another security group (rather than a CIDR block) to create a trust relationship between specific resource groups instead of IP ranges.

## Result
Private EC2 instances that are completely unreachable from the public internet, with all administrative access funneled through a single, tightly controlled Bastion Host.

## Skills Demonstrated
- Bastion Host architecture
- SSH jump-host connectivity
- Security group-to-security-group access scoping

## Commands Used
See [`Commands.md`](./Commands.md) for the SSH commands used to connect through the bastion.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Bastion_Host_Instance.png` | Bastion host instance details in the public subnet |
| 2 | `02_SSH_Via_Bastion.png` | SSH session connected to the private instance via the bastion |
| 3 | `03_Private_EC2_Security_Group.png` | Private instance security group scoped to the bastion security group |

## Conclusion
Introducing a Bastion Host closed off direct public access to private instances while still allowing controlled administrative access — a standard security pattern for production VPC design.
