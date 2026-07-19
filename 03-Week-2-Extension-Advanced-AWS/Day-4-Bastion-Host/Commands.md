# Commands Used – Day 4 Bastion Host & Private Connectivity

```bash
# SSH into the Bastion Host from the administrator machine
ssh -i "bastion-key.pem" ec2-user@<bastion-public-ip>

# From the Bastion Host, SSH into the private instance's internal IP
ssh -i "private-key.pem" ec2-user@<private-instance-internal-ip>
```
