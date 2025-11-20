data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "instance" {
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  network_interfaces {
    security_groups = var.security_group_instance_ids
  }
}

resource "aws_autoscaling_group" "instance" {

  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = var.target_group_arns
  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.instance.id
    version = "$Latest"
  }
}

