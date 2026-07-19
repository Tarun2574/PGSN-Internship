# Day 3 – Application Load Balancer & Auto Scaling

## Overview
This day introduces high availability and elasticity by placing an Application Load Balancer in front of a Target Group and connecting it to an Auto Scaling Group, so traffic is distributed across instances that scale automatically with demand.

## Objectives
- Create a Target Group
- Create an Application Load Balancer (ALB)
- Create an Auto Scaling Group (ASG) using the Day 2 launch template
- Verify traffic is distributed and the group scales as expected

## AWS Services Used
- Elastic Load Balancing (Application Load Balancer, Target Groups)
- Amazon EC2 Auto Scaling

## Prerequisites
- The multi-AZ VPC from Day 1
- The launch template from Day 2

## Implementation
1. **Created a Target Group** (`web-tg`) using instance targets on port 80/HTTP, with health checks enabled.
2. **Created an Application Load Balancer** (`week-2alb`), internet-facing, spanning the public subnets across both Availability Zones, with a listener on port 80 forwarding to `web-tg`.
3. **Created an Auto Scaling Group** (`week2-asg`) using the `week2-launch-template` from Day 2, attached to the target group, so newly launched instances automatically register for load balancing.
4. **Verified target registration and health checks**, and reviewed the ASG's scaling activity log to confirm instances launched and joined the group as expected.

## Verification
- The Load Balancer `week-2alb` showed status **Active** with its DNS name and listener configuration confirmed.
- The Target Group showed registered targets from the Auto Scaling Group.
- The Auto Scaling Group's **Activity** tab logged successful instance launch events tied to the group's scaling policy.

## Challenges & Troubleshooting
- Initial target health checks showed targets as "Unused" / "Target group is not configured to receive traffic from any load balancers" until the ALB listener was correctly attached to the target group — resolved by re-associating the listener.

## Key Learnings
- How an ALB, Target Group, and Auto Scaling Group work together: the ASG manages instance lifecycle, the Target Group tracks instance health, and the ALB routes traffic only to healthy targets.
- Why launch templates (Day 2) are a prerequisite for Auto Scaling — the ASG needs a repeatable, automated way to configure every new instance it creates.

## Result
A self-healing, horizontally scalable web tier: the ALB distributes incoming traffic, and the Auto Scaling Group automatically maintains the desired number of healthy instances behind it.

## Skills Demonstrated
- Application Load Balancer configuration
- Target Group and health check setup
- Auto Scaling Group configuration and monitoring

## Commands Used
No CLI commands were used for this task — all configuration was performed through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Load_Balancer_Created.png` | `week-2alb` Application Load Balancer successfully created |
| 2 | `02_Auto_Scaling_Group_Details.png` | `week2-asg` Auto Scaling Group configuration |
| 3 | `03_ASG_Scaling_Activity.png` | Auto Scaling Group activity log showing instance launches |

## Conclusion
With load balancing and auto scaling in place, the web tier can now absorb traffic spikes and recover from instance failures automatically — a key production-readiness pattern built directly on the Day 1 and Day 2 work.
