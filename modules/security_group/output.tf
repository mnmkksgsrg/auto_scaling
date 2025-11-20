output "security_group_alb_ids" {
  value = [aws_security_group.alb.id]
}

output "security_group_instance_ids" {
  value = [aws_security_group.instance.id]
}

