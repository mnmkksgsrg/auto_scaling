variable "alb_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "security_group_alb_ids" {
  type = list(string)
}


