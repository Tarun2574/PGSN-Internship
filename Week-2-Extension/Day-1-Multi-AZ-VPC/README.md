# Day 1 – Multi-AZ VPC

## Overview
This day extends the Week 2 custom VPC to span multiple Availability Zones, improving fault tolerance for the resources that will later sit behind a Load Balancer and Auto Scaling Group.

## Objectives
- Extend the existing VPC across multiple Availability Zones
- Create public and private subnets in each Availability Zone
- Confirm the VPC resource map reflects the multi-AZ layout

## AWS Services Used
- Amazon VPC (multi-AZ subnets, route tables)

## Prerequisites
- The `week2-vpc` created in Week 2, Task 2.2

## Implementation
1. **Reviewed the VPC dashboard** for `week2-vpc` (`vpc-0219c14ac73a8e1f6`), confirming its CIDR block and associated resources.
2. **Added subnets across a second Availability Zone**, so that both public and private tiers exist redundantly in more than one AZ.
3. **Reviewed the VPC resource map**, which visually confirmed subnets, route tables, and network connections spanning multiple Availability Zones.

## Verification
- The VPC dashboard listed multiple subnets associated with `week2-vpc`, distributed across Availability Zones.
- The resource map view showed each subnet correctly linked to its route table, with no orphaned or misconfigured associations.

## Challenges & Troubleshooting
- No issues encountered; this step built directly on the subnet/routing pattern established in Week 2, Task 2.2.

## Key Learnings
- Why single-AZ deployments are a single point of failure, and how spreading subnets across AZs is the first step toward high availability.
- How the VPC resource map is a fast way to visually audit subnet-to-route-table associations.

## Result
A VPC with public and private subnets distributed across multiple Availability Zones, ready to support a highly available Load Balancer and Auto Scaling Group in Day 3.

## Skills Demonstrated
- Multi-AZ network design
- VPC resource auditing via the console resource map

## Commands Used
No CLI commands were used for this task — all configuration was performed through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_VPC_Dashboard_MultiAZ.png` | `week2-vpc` dashboard showing VPC details |
| 2 | `02_VPC_Resource_Map.png` | Resource map showing subnets, route tables, and network connections across AZs |

## Conclusion
Extending the VPC across multiple Availability Zones set up the high-availability foundation used by the Application Load Balancer and Auto Scaling Group configured on Day 3.
