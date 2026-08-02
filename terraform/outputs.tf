output "vpc_id" {

  value = aws_vpc.taskflow_vpc.id

}


output "public_subnet_id" {

  value = aws_subnet.public_subnet.id

}


output "instance_id" {

  value = aws_instance.taskflow_ec2.id

}


output "public_ip" {

  value = aws_instance.taskflow_ec2.public_ip

}


output "application_url" {

  value = "http://${aws_instance.taskflow_ec2.public_ip}:5000"

}


output "ebs_volume_id" {

  value = aws_ebs_volume.taskflow_data_volume.id

}


output "snapshot_id" {

  value = aws_ebs_snapshot.taskflow_snapshot.id

}