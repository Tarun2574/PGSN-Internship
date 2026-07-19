# Day 2 – Terraform Modules, Remote Backend & Workspaces

## Overview
This day extends the Day 1 Terraform fundamentals by organizing configuration into reusable modules and configuring a remote backend so Terraform state is stored centrally rather than only on the local machine.

## Objectives
- Structure Terraform configuration using modules
- Configure a remote backend (Amazon S3) for state storage
- Understand Terraform workspaces for managing multiple environments

## AWS Services Used
- Amazon S3 (Terraform remote state backend)
- Amazon EC2 (resources provisioned through modules)

## Prerequisites
- Terraform fundamentals from Day 1
- An S3 bucket available to store Terraform state

## Implementation
1. **Refactored the configuration into modules**, separating reusable resource definitions from the root configuration that calls them.
2. **Ran `terraform init`** again after adding the module reference, which downloaded/linked the module alongside the AWS provider.
3. **Configured a remote backend** pointing Terraform state storage to an S3 bucket, including backend encryption settings, so state is stored durably and can be shared across a team rather than kept only on a local disk.

## Verification
- `terraform init` output confirmed the backend was successfully configured and the module was initialized without errors.
- The backend configuration block (bucket, key, region, encryption) was reviewed and confirmed to point at the correct S3 location before applying.

## Challenges & Troubleshooting
- No blocking issues; care was taken to confirm the backend configuration (bucket/key) before running `apply`, since changing a backend after state already exists requires an explicit state migration step.

## Key Learnings
- Modules let common infrastructure patterns (e.g., "an EC2 web server") be defined once and reused with different input variables, reducing duplication.
- A remote backend (S3) solves the "state file on one laptop" problem — critical for any real team workflow — and can be paired with state locking to prevent concurrent conflicting applies.
- Workspaces allow the same configuration to manage multiple, isolated environments (e.g., dev/staging/prod) using separate state files.

## Result
A modular Terraform configuration backed by remote state in S3, ready to scale beyond a single local workflow.

## Skills Demonstrated
- Terraform module design
- Remote backend configuration (S3)
- Understanding of Terraform workspaces for multi-environment management

## Commands Used
See [`Commands.md`](./Commands.md) for the Terraform commands used.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Terraform_Init_Modules.png` | `terraform init` output after adding a module |
| 2 | `02_Terraform_Backend_Config.png` | Remote backend (S3) configuration block |

## Conclusion
Modularizing the configuration and moving to a remote backend turned the Day 1 proof-of-concept into a structure that could realistically support a team and multiple environments — a direct prerequisite for the automated deployment pipeline built later in the week.
