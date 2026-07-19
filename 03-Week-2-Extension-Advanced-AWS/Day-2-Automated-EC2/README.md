# Day 2 – Automated EC2 Provisioning

## Overview
This day automates EC2 provisioning using launch templates and EC2 User Data, so new instances configure themselves (installing software, writing content) automatically on first boot instead of requiring manual setup.

## Objectives
- Create an EC2 launch template
- Use User Data to automate instance configuration on boot
- Verify the automation ran successfully

## AWS Services Used
- Amazon EC2 (Launch Templates, User Data)

## Prerequisites
- The custom VPC and subnets from Task 2.2 / Day 1

## Implementation
1. **Created a launch template** (`week2-launch-template`) defining the AMI, instance type, key pair, security group, and network settings to be reused for future instance launches.
2. **Attached a User Data script** to the launch template so that instances launched from it automatically install and configure their web server on first boot.
3. **Launched an instance from the template** and confirmed the User Data script executed by checking the resulting page content on the instance (`WebServer2`).

## Verification
- The launch template details page confirmed the template version, AMI, and network configuration were saved correctly.
- The deployed instance served the expected User Data output — a page reading **"WebServer2"** — confirming the automation script ran successfully without manual intervention.

## Challenges & Troubleshooting
- No blocking issues; the main learning curve was correctly scoping the launch template's network settings (subnet/security group) so instances launched from it landed in the right VPC subnet automatically.

## Key Learnings
- How launch templates standardize instance configuration and make future scaling (via Auto Scaling Groups) possible.
- How EC2 User Data removes the need for manual post-launch configuration, which is essential once instances are being created and destroyed automatically by an Auto Scaling Group.

## Result
A reusable EC2 launch template with an automated User Data bootstrap script, verified to correctly configure a new instance without any manual steps.

## Skills Demonstrated
- EC2 Launch Template configuration
- Instance bootstrapping via User Data
- Infrastructure automation fundamentals

## Commands Used
No CLI commands were used for this task — configuration was performed through the AWS Management Console (User Data script content is embedded in the launch template).

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_UserData_Script_Result.png` | Deployed page confirming the User Data script executed ("WebServer2") |
| 2 | `02_Launch_Template_Details.png` | `week2-launch-template` configuration details |

## Conclusion
Automated provisioning via launch templates and User Data is the mechanism that makes Auto Scaling possible — every new instance the Auto Scaling Group creates on Day 3 configures itself the same way, with zero manual steps.
