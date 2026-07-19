# Commands Used – Task 2.3 Storage Exploration

Commands run on the EC2 instance to inspect and mount the attached EBS volume.

```bash
# List block devices to identify the newly attached volume
lsblk

# Example output showed the additional volume as xvdf, mounted at /data
# alongside the root volume (xvda) and boot partition (xvda127/xvda128)
```
