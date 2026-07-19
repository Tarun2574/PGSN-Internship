# Task 2.1 – Web Server on EC2

## Overview
This task covers launching an Amazon EC2 instance from scratch, connecting to it over SSH, installing and configuring Nginx as a web server, deploying a static webpage, and verifying the site is reachable from a browser via an Elastic IP.

## Objectives
- Launch an EC2 instance running Amazon Linux 2023
- Connect to the instance using SSH
- Install and start Nginx
- Deploy a static HTML page
- Associate an Elastic IP for a stable public address
- Verify the website loads correctly in a browser

## AWS Services Used
- Amazon EC2 (instance, security group, key pair)
- Elastic IP (EIP)

## Prerequisites
- An AWS account with EC2 access
- A key pair for SSH access
- A security group allowing inbound SSH (22) and HTTP (80)

## Implementation
1. **Launched an EC2 instance** (`WebServer1`) running Amazon Linux 2023 from the EC2 console launch wizard.
2. **Connected to the instance** using the browser-based SSH client, then ran a system update:
   ```
   sudo dnf update -y
   ```
3. **Installed Nginx**:
   ```
   sudo dnf install nginx -y
   ```
4. **Started and enabled the Nginx service** so it persists across reboots:
   ```
   sudo systemctl start nginx
   sudo systemctl enable nginx
   sudo systemctl status nginx
   ```
5. **Deployed a static page** by writing a heading into the default web root and confirming it locally:
   ```
   echo "<h1>My AWS Week 2 Project</h1>" | sudo tee /usr/share/nginx/html/index.html
   curl localhost
   ```
6. **Allocated and associated an Elastic IP** with the instance so the public address stays fixed even if the instance is stopped/started.
7. **Verified the deployment** by loading both the instance's original public IP and the Elastic IP in a browser.

## Verification
- `systemctl status nginx` showed the service `active (running)`, loaded from `/usr/lib/systemd/system/nginx.service`.
- The nginx config test passed (`nginx: configuration file /etc/nginx/nginx.conf test is successful`).
- The page **"My AWS Week 2 Project"** rendered successfully in the browser at the instance's public IP and again at the Elastic IP address, confirming the EIP association worked correctly.

## Challenges & Troubleshooting
- An early SSH session showed a stray `-bash: $'\E[200~sudo...': command not found` error — caused by a terminal bracketed-paste artifact when pasting a command. Re-running the plain `sudo dnf update -y` command resolved it.

## Key Learnings
- How to move from a freshly launched EC2 instance to a live, browser-accessible web server end to end.
- Why Elastic IPs matter: without one, the public IP changes on stop/start, breaking any DNS or bookmarked links.
- The difference between installing a service and actually enabling it to survive reboots (`systemctl enable`).

## Result
A running EC2 instance serving a static Nginx page, reachable over a stable Elastic IP address.

## Skills Demonstrated
- EC2 instance provisioning
- Linux server administration (SSH, package management, systemd)
- Web server configuration (Nginx)
- Elastic IP management

## Commands Used
See [`Commands.md`](./Commands.md) for the full list of commands executed on the instance.

## Screenshot References
| # | Screenshot | Description |
|---|---|---|
| 1 | `01_Launch_EC2_Instance.png` | EC2 "Connect to instance" screen for the newly launched `WebServer1` |
| 2 | `02_Connect_SSH_Update_Packages.png` | SSH session connected, running `sudo dnf update -y` |
| 3 | `03_Install_Nginx.png` | Nginx package installation output |
| 4 | `04_Verify_Nginx_Running.png` | `systemctl status nginx` confirming the service is active |
| 5 | `05_Website_Live_Browser.png` | Static page loading successfully via the Elastic IP in the browser |

## Conclusion
Task 2.1 established the foundational skill set for the rest of the internship: provisioning compute, connecting securely, and serving content from an EC2 instance. This groundwork is reused and extended in later VPC and load-balancing tasks.
