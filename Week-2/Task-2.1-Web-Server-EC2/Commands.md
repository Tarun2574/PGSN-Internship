# Commands Used – Task 2.1 Web Server on EC2

Commands run on the EC2 instance via the browser-based SSH client, in the order they were executed.

```bash
# System update
sudo dnf update -y

# Install Nginx
sudo dnf install nginx -y

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Check service status
sudo systemctl status nginx

# Deploy a static page
echo "<h1>My AWS Week 2 Project</h1>" | sudo tee /usr/share/nginx/html/index.html

# Verify locally on the instance
curl localhost
```
