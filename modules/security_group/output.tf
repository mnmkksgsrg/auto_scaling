output "ec2_security_group_ids" {
  value = [for security_group in aws_security_group.ec2 : security_group.id ]
}

