# TaskFlow AWS Terraform Deployment

## Overview

Terraform provisions the complete AWS infrastructure required to run TaskFlow.

---

## Resources Created

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- EBS Volume
- EBS Snapshot

---

## Terraform Structure


terraform/

├── providers.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── user_data.sh
├── ebs.tf
└── snapshot.tf


---

## Deployment Steps

Initialize:

```bash
terraform init

Validate:

terraform validate

Plan:

terraform plan

Deploy:

terraform apply
EC2 Configuration

Instance:

Amazon Linux
t2.micro

Region:

ap-south-1
Storage Configuration

Additional EBS volume:

Size: 5GB
Type: gp3
Device: /dev/xvdf

Mounted location:

/app/data

Application task data remains persistent even if the container restarts.

Snapshot Backup

Terraform creates an EBS snapshot for backup:

TaskFlow Data Backup Snapshot
Output Values

After deployment:

terraform output

Displays:

VPC ID
EC2 Instance ID
Public IP
Application URL
EBS Volume ID
Snapshot ID
Architecture Flow
Terraform

    |

    v

AWS VPC

    |

    v

EC2 Instance

    |

    v

Docker Container

    |

    v

Flask Application

    |

    v

EBS Persistent Storage