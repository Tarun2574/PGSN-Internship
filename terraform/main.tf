resource "aws_vpc" "taskflow_vpc" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true


  tags = {

    Name = "${var.project_name}-vpc"

  }

}



resource "aws_internet_gateway" "taskflow_igw" {

  vpc_id = aws_vpc.taskflow_vpc.id


  tags = {

    Name = "${var.project_name}-igw"

  }

}



resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.taskflow_vpc.id

  cidr_block = var.public_subnet_cidr

  availability_zone = var.public_availability_zone

  map_public_ip_on_launch = true


  tags = {

    Name = "${var.project_name}-public-subnet"

  }

}



resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.taskflow_vpc.id

  cidr_block = var.private_subnet_cidr

  availability_zone = var.private_availability_zone


  tags = {

    Name = "${var.project_name}-private-subnet"

  }

}



resource "aws_route_table" "public_route_table" {

  vpc_id = aws_vpc.taskflow_vpc.id


  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.taskflow_igw.id

  }


  tags = {

    Name = "${var.project_name}-public-route-table"

  }

}



resource "aws_route_table_association" "public_association" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_route_table.id

}



resource "aws_security_group" "taskflow_sg" {

  name = "${var.project_name}-security-group"

  vpc_id = aws_vpc.taskflow_vpc.id



  ingress {

    from_port = 5000

    to_port = 5000

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}



resource "aws_instance" "taskflow_ec2" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  key_name = var.key_name


  vpc_security_group_ids = [

    aws_security_group.taskflow_sg.id

  ]


  user_data = file("user_data.sh")


  tags = {

    Name = "${var.project_name}-ec2"

  }

}