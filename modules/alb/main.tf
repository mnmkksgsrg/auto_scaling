resource "aws_lb" "alb" {
  internal = "false"
  load_balancer_type = "application"
  security_grooups = var.security_group_alb_ids
  subnets = var.public_subnets_ids
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "instance" {
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "instance" {
  target_group_arn = aws_lb_target_group.instance.arn
  target_id = var.instance_id
  port = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb_alb.arn
  port = 80
  prptocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.instance.arn
  }
}

