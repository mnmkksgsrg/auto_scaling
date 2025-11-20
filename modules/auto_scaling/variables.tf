variable "instance_type" {
  type = string
}

variable "target_group_arns" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_instance_ids" {
  type = list(string)
}

