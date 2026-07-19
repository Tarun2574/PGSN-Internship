# Day 1 – Terraform Fundamentals

## Overview
This day introduces Infrastructure-as-Code using Terraform: writing configuration, planning changes, applying them to AWS, and safely tearing them down.

## Objectives
- Initialize a Terraform working directory
- Write a Terraform configuration targeting AWS
- Run `terraform plan` to preview changes
- Run `terraform apply` to provision infrastructure
- Run `terraform destroy` to tear it down safely

## AWS Services Used
- Amazon EC2 (provisioned via Terraform)
- AWS provider (Terraform)

## Prerequisites
- Terraform CLI installed locally
- AWS credentials configured for the Terraform AWS provider

## Implementation
1. **Initialized the working directory** with `terraform init`, downloading the required AWS provider plugins.
2. **Ran `terraform plan`**, reviewing the execution plan showing resources to be created (e.g., an EC2 instance) before making any changes.
3. **Ran `terraform apply`**, confirming the plan and provisioning the infrastructure. Terraform reported the resource created along with its ID.
4. **Ran `terraform destroy`**, previewing and confirming the teardown plan to cleanly remove the provisioned resources and avoid ongoing cost.

## Verification
- `terraform plan` output listed the exact resources to be added, changed, or destroyed (`Plan: X to add, 0 to change, 0 to destroy`).
- `terraform apply` completed with **"Apply complete!"** and a summary of resources added/changed/destroyed.
- `terraform destroy` produced a plan showing the resources to be removed, confirming Terraform was tracking state correctly.

## Challenges & Troubleshooting
- No blocking errors were encountered; the standard Terraform workflow (`init` → `plan` → `apply` → `destroy`) executed cleanly against the configured AWS provider.

## Key Learnings
- Terraform's plan/apply separation means changes are always previewable before they're made — a major safety advantage over manual console changes.
- Terraform maintains state to know exactly what it created, which is what makes `terraform destroy` able to cleanly remove only the resources it manages.

## Result
A working Terraform configuration capable of provisioning and destroying AWS infrastructure repeatably, replacing manual console clicks with version-controlled code.

## Skills Demonstrated
- Terraform CLI workflow (init, plan, apply, destroy)
- Infrastructure-as-Code fundamentals
- AWS provider configuration

## Commands Used
See [`Commands.md`](./Commands.md) for the Terraform commands used.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Terraform_Plan.png` | `terraform plan` output previewing resource creation |
| 2 | `02_Terraform_Apply_Complete.png` | `terraform apply` completed successfully |
| 3 | `03_Terraform_Destroy_Plan.png` | `terraform destroy` plan previewing resource removal |

## Conclusion
This day established the core Terraform workflow that is reused and expanded (modules, remote backend, workspaces) on Day 2, and ultimately used to deploy the containerized application in Day 5.
