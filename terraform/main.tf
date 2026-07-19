terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "devpulse_sg" {
  name        = "devpulse-security-group"
  description = "Allow HTTP and SSH access for DevPulse"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devpulse-security-group"
  }
}

resource "aws_instance" "devpulse" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devpulse_sg.id]

  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y

              apt-get install -y docker.io

              systemctl start docker
              systemctl enable docker

              usermod -aG docker ubuntu

              docker pull mtarunkumar/devpulse-portfolio:latest

              docker run -d \
                --name devpulse-app \
                -p 80:80 \
                mtarunkumar/devpulse-portfolio:latest
              EOF

  tags = {
    Name = "devpulse-portfolio"
  }
}