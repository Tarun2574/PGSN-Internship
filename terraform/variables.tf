variable "aws_region" {

  description = "AWS Region"

  type = string

  default = "ap-south-1"

}


variable "project_name" {

  description = "Project Name"

  type = string

  default = "taskflow"

}


variable "vpc_cidr" {

  description = "VPC CIDR Block"

  type = string

  default = "10.0.0.0/16"

}


variable "public_subnet_cidr" {

  description = "Public Subnet CIDR"

  type = string

  default = "10.0.1.0/24"

}


variable "private_subnet_cidr" {

  description = "Private Subnet CIDR"

  type = string

  default = "10.0.2.0/24"

}


variable "public_availability_zone" {

  description = "Public Subnet Availability Zone"

  type = string

  default = "ap-south-1a"

}

variable "private_availability_zone" {

  description = "Private Subnet Availability Zone"

  type = string

  default = "ap-south-1b"

}


variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

  default = "t2.micro"

}


variable "ami_id" {

  description = "Amazon Linux AMI"

  type = string

}


variable "key_name" {

  description = "EC2 Key Pair Name"

  type = string

}