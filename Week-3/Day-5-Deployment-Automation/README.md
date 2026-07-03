# Day 5 – AWS Deployment Automation

## Overview
This day connects the pieces built earlier in the week — Terraform (Day 1–2) and Docker (Day 3) — to provision AWS infrastructure automatically via Terraform for running the containerized application.

## Objectives
- Use Terraform to provision the EC2 instance that will run the Docker application
- Confirm the provisioned infrastructure via Terraform's apply output

## AWS Services Used
- Amazon EC2 (provisioned via Terraform)

## Prerequisites
- The Terraform fundamentals and remote backend from Day 1–2
- The Dockerized application from Day 3

## Implementation
1. **Wrote/updated the Terraform configuration** to define the EC2 instance intended to run the containerized application, including any required User Data for Docker installation and container startup.
2. **Ran `terraform apply`**, which provisioned the EC2 instance automatically.

## Verification
- The `terraform apply` output confirmed **"Creation complete after 39s [id=...]"**, showing the EC2 instance resource was successfully created and its resource ID logged in Terraform's output.

## Challenges & Troubleshooting
- No blocking issues encountered during this apply run; state and provider configuration from Day 1–2 carried over cleanly.

## Key Learnings
- How Terraform can provision the exact compute environment a Dockerized application needs, combining Infrastructure-as-Code with containerization into a single repeatable deployment.
- The value of `terraform apply` output as a verification artifact — the resource ID and timing confirm precisely what was created and when.

## Result
An EC2 instance provisioned automatically by Terraform, ready to run the Dockerized application built earlier in the week — deployment infrastructure that no longer requires manual console steps.

## Skills Demonstrated
- Combining Terraform and Docker in a single deployment workflow
- AWS resource provisioning automation

## Commands Used
See [`Commands.md`](./Commands.md) for the command used.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Terraform_EC2_Apply.png` | `terraform apply` output confirming EC2 instance creation |

## Conclusion
This day is the payoff for the week's earlier building blocks: Terraform now provisions the exact compute infrastructure needed to run the Dockerized application, automatically and repeatably.
