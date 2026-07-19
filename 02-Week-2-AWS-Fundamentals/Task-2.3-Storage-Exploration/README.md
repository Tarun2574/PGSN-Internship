# Task 2.3 – Storage Exploration

## Overview
This task explores two core AWS storage services: Amazon S3 (object storage, used to host a static website) and Amazon EBS (block storage, attached to an EC2 instance, snapshotted, and mounted).

## Objectives
- Host a static website on Amazon S3
- Create and attach an EBS volume to an EC2 instance
- Format and mount the volume
- Create an EBS snapshot
- Restore/verify a volume from the snapshot

## AWS Services Used
- Amazon S3 (bucket, static website hosting, bucket policy)
- Amazon EBS (volume, snapshot)
- Amazon EC2 (host for the attached volume)

## Prerequisites
- An S3 bucket with public access configured for static hosting
- A running EC2 instance to attach the EBS volume to

## Implementation
1. **Created an S3 bucket** and uploaded a static HTML file.
2. **Enabled static website hosting** on the bucket and configured a bucket policy allowing public read access to the objects.
3. **Verified the S3 static site** by loading the bucket's website endpoint in a browser — it displayed **"Hello from AWS S3!"**.
4. **Created an EBS volume** and attached it to a running EC2 instance.
5. **Formatted and mounted the volume** inside the instance, confirming the new block device appeared under `lsblk`.
6. **Created an EBS snapshot** of the volume as a point-in-time backup.
7. **Verified the mounted volume** by checking the mount point and available disk space from inside the instance.

## Verification
- The S3 bucket upload summary showed **"Upload succeeded"** with 100% success rate.
- The static website endpoint served the page content correctly and directly in the browser (no login/console chrome).
- `lsblk` output on the instance showed the additional EBS device (`xvdf`) mounted at `/data`, alongside the root volume (`xvda`) and boot partition.
- The EBS snapshot showed status **"Completed"** in the console after creation.

## Challenges & Troubleshooting
- No blocking issues were encountered; the main adjustment was correcting the S3 bucket policy JSON so that `"Effect": "Allow"` correctly scoped read access to the bucket's objects (`arn:aws:s3:::<bucket>/*`) rather than the bucket itself.

## Key Learnings
- The difference between **object storage** (S3 — ideal for static content, accessed over HTTP) and **block storage** (EBS — attached directly to an instance's filesystem).
- Why S3 static website hosting requires both "Block Public Access" to be disabled and an explicit bucket policy.
- How snapshots provide point-in-time, incremental backups of EBS volumes without interrupting the running instance.

## Result
A publicly accessible S3-hosted static website and a formatted, mounted EBS volume with a verified snapshot — demonstrating both AWS storage models in a single task.

## Skills Demonstrated
- S3 bucket configuration and static website hosting
- IAM/bucket policy authoring
- EBS volume lifecycle management (create, attach, format, mount, snapshot)
- Linux disk management (`lsblk`, mount points)

## Commands Used
See [`Commands.md`](./Commands.md) for the Linux commands used to inspect and mount the EBS volume.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_S3_Upload_Success.png` | Successful file upload to the S3 bucket |
| 2 | `02_S3_Static_Website_Verified.png` | Static website endpoint rendering "Hello from AWS S3!" |
| 3 | `03_EBS_Volume_Details.png` | EBS volume details, showing attachment to the instance |
| 4 | `04_EBS_Snapshot_Created.png` | Completed EBS snapshot |
| 5 | `05_EBS_Volume_Mounted.png` | `lsblk` output confirming the volume is mounted at `/data` |

## Conclusion
Task 2.3 provided hands-on experience with the two most common AWS storage patterns — durable object storage for static content and attached block storage for instance-level data — both of which reappear in the Week 2 Extension advanced storage work.
