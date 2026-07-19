# Day 6 – Monitoring & Logging

## Overview
This day adds application/infrastructure-level monitoring using Amazon CloudWatch Alarms, building on the VPC Flow Logs monitoring configured in Week 2 Extension.

## Objectives
- Create a CloudWatch alarm to monitor resource health/performance
- Verify the alarm is configured and active

## AWS Services Used
- Amazon CloudWatch (Alarms)

## Prerequisites
- The EC2 infrastructure provisioned in Day 5

## Implementation
1. **Created a CloudWatch alarm** to monitor a metric on the deployed infrastructure (e.g., CPU utilization), defining the threshold and evaluation period that should trigger the alarm.
2. **Reviewed the alarm details** to confirm its configuration — metric, namespace, threshold, and current state.

## Verification
- The CloudWatch alarm details page confirmed the alarm's **Name**, **Threshold**, **Metric**, and **Namespace (AWS/EC2)**, along with its current state.

## Challenges & Troubleshooting
- No blocking issues; the alarm was reviewed shortly after creation, showing an **"Insufficient data"**-style initial state, which is expected until enough metric data points have been collected.

## Key Learnings
- CloudWatch Alarms need a defined evaluation period and enough data points before they can accurately reflect resource state — a newly created alarm won't immediately show `OK`/`ALARM`.
- Combining VPC Flow Logs (network layer, from Week 2 Extension) with CloudWatch Alarms (resource/metric layer) gives visibility across both the network and compute layers of the deployed infrastructure.

## Result
An active CloudWatch alarm monitoring the deployed infrastructure, completing the monitoring/logging coverage started with VPC Flow Logs in Week 2 Extension.

## Skills Demonstrated
- CloudWatch Alarm configuration
- Metric-based monitoring fundamentals

## Commands Used
No CLI commands were used for this task — the alarm was configured through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_CloudWatch_Alarm.png` | CloudWatch alarm details and configuration |

## Conclusion
With a CloudWatch alarm in place, the deployed infrastructure now has automated visibility into its own health — the final piece before pulling everything together in the Day 7 final project.
