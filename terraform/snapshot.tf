resource "aws_ebs_snapshot" "taskflow_snapshot" {

  volume_id = aws_ebs_volume.taskflow_data_volume.id


  description = "TaskFlow application data backup snapshot"


  tags = {

    Name = "${var.project_name}-snapshot"

  }

}