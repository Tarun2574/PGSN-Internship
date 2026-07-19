# Day 5 – Advanced Storage

## Overview
This day builds on the basic S3/EBS work from Task 2.3 by adding S3 bucket versioning, an S3 lifecycle rule for automated cost optimization, and an additional EBS snapshot for backup verification.

## Objectives
- Enable versioning on an S3 bucket
- Configure an S3 lifecycle rule to transition objects to a cheaper storage class
- Create an EBS snapshot for backup

## AWS Services Used
- Amazon S3 (Versioning, Lifecycle Rules)
- Amazon EBS (Snapshots)

## Prerequisites
- An existing S3 bucket from Task 2.3
- An existing EBS volume from Task 2.3

## Implementation
1. **Enabled Bucket Versioning** on the S3 bucket, so every object modification or deletion preserves the previous version instead of overwriting it.
2. **Created a lifecycle rule** (`TransitionToStandardIA`) to automatically transition objects to the Standard-IA (Infrequent Access) storage class after a set number of days, reducing storage cost for older data.
3. **Created a new EBS snapshot** of the attached volume to capture the current state as a recovery point.

## Verification
- The bucket's **Properties** tab confirmed **Bucket Versioning: Enable**.
- The **Lifecycle rules** tab listed `TransitionToStandardIA` as an active rule with its configured transition action.
- The EBS snapshot showed status **Completed**, confirming the backup was captured successfully.

## Challenges & Troubleshooting
- No blocking issues encountered; enabling versioning after objects already existed in the bucket did not require any migration — new versions simply began being tracked going forward.

## Key Learnings
- Versioning protects against accidental overwrites/deletes but increases storage usage over time — lifecycle rules help offset that cost by aging out older versions/objects to cheaper storage tiers.
- Snapshots are incremental: after the first, subsequent snapshots only store changed blocks, making regular backups efficient.

## Result
A versioned, cost-optimized S3 bucket and a fresh EBS snapshot — both storage layers now have both durability (versioning/snapshots) and cost controls (lifecycle rules) in place.

## Skills Demonstrated
- S3 Versioning configuration
- S3 Lifecycle rule authoring
- EBS snapshot management

## Commands Used
No CLI commands were used for this task — all configuration was performed through the AWS Management Console.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_S3_Bucket_Versioning_Enabled.png` | Bucket Versioning enabled on the S3 bucket |
| 2 | `02_S3_Lifecycle_Rule.png` | `TransitionToStandardIA` lifecycle rule configuration |
| 3 | `03_EBS_Snapshot_Created.png` | New EBS snapshot completed successfully |

## Conclusion
Adding versioning, lifecycle policies, and snapshot backups turns the basic storage setup from Task 2.3 into a more production-realistic configuration that balances durability, recoverability, and cost.
