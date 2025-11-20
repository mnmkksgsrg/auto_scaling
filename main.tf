module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.vpc.public_subnet_ids
  security_group_alb_ids = module.security_group.security_group_alb_ids
}

module "auto_scaling" {
  source = "./modules/auto_scaling"

  instance_type               = var.instance_type
  private_subnet_ids          = module.vpc.private_subnet_ids
  target_group_arns           = [module.alb.target_group_arn]
  security_group_instance_ids = module.security_group.security_group_instance_ids
}

