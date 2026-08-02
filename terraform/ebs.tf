resource "aws_ebs_volume" "taskflow_data_volume" {

availability_zone = var.public_availability_zone

  size = 5

  type = "gp3"


  tags = {

    Name = "${var.project_name}-data-volume"

  }

}


resource "aws_volume_attachment" "taskflow_volume_attachment" {

  device_name = "/dev/xvdf"

  volume_id = aws_ebs_volume.taskflow_data_volume.id

  instance_id = aws_instance.taskflow_ec2.id

}