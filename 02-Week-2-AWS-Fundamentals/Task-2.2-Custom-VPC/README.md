# Task 2.2 – Custom VPC

## Overview
This task builds a custom Virtual Private Cloud (VPC) from scratch, including public and private subnets, an Internet Gateway, a NAT Gateway, route tables, and security groups — then deploys and verifies EC2 instances inside that network.

## Objectives
- Create a custom VPC
- Create public and private subnets
- Configure an Internet Gateway for public internet access
- Configure a NAT Gateway so private resources can reach the internet outbound
- Configure route tables to direct traffic correctly
- Configure Security Groups to control inbound/outbound access
- Launch EC2 instances into the VPC
- Verify networking end to end

## AWS Services Used
- Amazon VPC (VPC, Subnets, Route Tables, Internet Gateway, NAT Gateway)
- Amazon EC2
- Security Groups
- Elastic IP (used for the NAT Gateway)

## Prerequisites
- A custom VPC CIDR block (`10.0.0.0/16`)
- An allocated Elastic IP for the NAT Gateway

## Implementation
1. **Created the VPC** (`week2-vpc`) with CIDR block `10.0.0.0/16`.
2. **Created subnets** inside the VPC — a Public Subnet and a Private Subnet, each with its own CIDR block.
3. **Created and attached an Internet Gateway** (`Week2-IGW`) to the VPC so the public subnet can reach the internet.
4. **Allocated an Elastic IP and created a NAT Gateway** (`Week2-NAT`) in the public subnet, giving the private subnet outbound-only internet access.
5. **Configured route tables**:
   - The **Public Route Table** routes `0.0.0.0/0` to the Internet Gateway.
   - The **Private Route Table** routes `0.0.0.0/0` to the NAT Gateway, while keeping `10.0.0.0/16` local.
6. **Configured Security Group rules**, allowing inbound SSH (22) and HTTP (443/80 as applicable) only from expected sources, with all other traffic denied by default.
7. **Launched EC2 instances into the VPC** (public and private), confirming they picked up the correct subnet and private IP ranges.
8. **Verified networking** by checking that instances in the public subnet were reachable and that private subnet resources could route outbound traffic through the NAT Gateway.

## Verification
- The Internet Gateway showed `Attached` status against `week2-vpc`.
- The NAT Gateway (`nat-01a943bea55810247`) showed state `Available` and correctly listed its public/private IP addresses.
- Route table `Private-RT` showed two active routes: local traffic to `10.0.0.0/16` and default (`0.0.0.0/0`) traffic to the NAT Gateway.
- EC2 instances launched into the VPC displayed the expected private IP addressing from the subnet CIDR ranges.

## Challenges & Troubleshooting
- When creating an additional subnet, the console flagged **"CIDR Address overlaps with existing Subnet CIDR"** — resolved by selecting a non-overlapping `/24` block within the VPC's `/16` range.

## Key Learnings
- The distinction between an Internet Gateway (two-way access for public subnets) and a NAT Gateway (outbound-only access for private subnets).
- How route table associations — not the subnet itself — determine whether a subnet behaves as "public" or "private."
- Why overlapping CIDR ranges are rejected and how to plan subnet addressing to avoid it.

## Result
A fully functional custom VPC with segmented public/private subnets, correct routing, and verified EC2 connectivity — the network foundation used by later Week 2 Extension tasks (ALB, Auto Scaling, Bastion Host).

## Skills Demonstrated
- VPC and subnet design
- Internet Gateway and NAT Gateway configuration
- Route table management
- Security Group rule configuration
- Network verification and troubleshooting

## Commands Used
No CLI commands were used for this task — all configuration was performed through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Create_Subnets.png` | Subnets created inside `week2-vpc` |
| 2 | `02_Internet_Gateway_Attached.png` | `Week2-IGW` successfully attached to the VPC |
| 3 | `03_Create_NAT_Gateway.png` | NAT Gateway creation configuration |
| 4 | `04_Route_Tables.png` | Route table listing showing Public-RT and Private-RT |
| 5 | `05_Security_Group_Rules.png` | Inbound security group rules (SSH/HTTP) |
| 6 | `06_EC2_Deployed_In_VPC.png` | EC2 instance running inside the custom VPC |

## Conclusion
Task 2.2 replaced the AWS default VPC with a purpose-built network, giving explicit control over subnet segmentation, routing, and access — the networking pattern reused throughout the rest of the internship.
