# Day 6 – Monitoring, CloudWatch & VPC Endpoints

## Overview
This day adds network-level visibility to the VPC by enabling VPC Flow Logs, which capture IP traffic metadata for auditing and troubleshooting, and sets up the supporting IAM role required for log delivery.

## Objectives
- Create an IAM role permitting VPC Flow Logs to publish to CloudWatch Logs
- Enable VPC Flow Logs on the custom VPC
- Verify flow log delivery is active

## AWS Services Used
- Amazon VPC (Flow Logs)
- AWS IAM (Role)
- Amazon CloudWatch Logs

## Prerequisites
- The custom VPC (`week2-vpc`) from Task 2.2 / Day 1

## Implementation
1. **Created an IAM role** (`VPCFlowLogsRole`) with the permissions policy required to allow the VPC Flow Logs service to write log data to CloudWatch Logs.
2. **Created a VPC Flow Log** (`week2-flowlog-1`) on `week2-vpc`, selecting **All** traffic (accepted and rejected) and configuring the destination CloudWatch Logs group along with the newly created IAM role.
3. **Verified the flow log configuration**, confirming the correct IAM role, destination log group, and traffic type were applied.

## Verification
- The `VPCFlowLogsRole` IAM role summary confirmed it was created successfully with an attached permissions policy.
- The Flow Log details page for `week2-flowlog-1` showed **Active** status, correct VPC ID, destination log group, and IAM role association.

## Challenges & Troubleshooting
- The flow log destination log group selection initially listed unrelated service-linked roles (e.g., `AWSServiceRoleForAutoScaling`) in the role picker — resolved by explicitly selecting the purpose-built `VPCFlowLogsRole` created for this task.

## Key Learnings
- VPC Flow Logs capture metadata (source/destination IP, port, protocol, accept/reject) — not packet contents — making them useful for traffic auditing and security group troubleshooting without capturing sensitive payload data.
- Flow Logs require an explicit IAM role with `logs:CreateLogStream` / `logs:PutLogEvents` permissions before they can deliver data to CloudWatch Logs.

## Result
Full network traffic visibility on the custom VPC via CloudWatch-backed Flow Logs, giving a durable audit trail of accepted and rejected connections.

## Skills Demonstrated
- IAM role creation and policy scoping
- VPC Flow Logs configuration
- CloudWatch Logs integration

## Commands Used
No CLI commands were used for this task — all configuration was performed through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_VPCFlowLogsRole_IAM_Role.png` | `VPCFlowLogsRole` IAM role created successfully |
| 2 | `02_VPC_Flow_Log_Details.png` | `week2-flowlog-1` Flow Log active and correctly configured |

## Conclusion
With Flow Logs enabled, the VPC now has an auditable record of network traffic, closing the observability gap left after Days 1–5 focused purely on building the infrastructure itself.
