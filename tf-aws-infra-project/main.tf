module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "security_group" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source = "./modules/alb"

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
  alb_sg         = module.security_group.alb_sg_id
}

module "autoscaling" {
  source = "./modules/autoscaling"

  ami              = "ami-0c02fb55956c7d316"
  instance_type    = var.instance_type
  private_subnets  = module.vpc.private_subnet_ids
  ec2_sg           = module.security_group.ec2_sg_id
  target_group_arn = module.alb.target_group_arn
  instance_profile = module.iam.instance_profile_name
  user_data        = file("${path.module}/scripts/user_data.sh")
}