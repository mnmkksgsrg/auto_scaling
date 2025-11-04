resource "aws_lounch_template" "instance" {
  image_id = var.ami_id
  instance_type = var.instance_type

resource "aws_autoscaling_group" "instance" {
  
  desired_capacity = 1
  max_size = 2
  min_size = 1
  health_check_grace_period = 300
  health_check_type = "ELB"

  launch_template {
    id = aws_launch_template.instance.id
    version = 
  }
}

