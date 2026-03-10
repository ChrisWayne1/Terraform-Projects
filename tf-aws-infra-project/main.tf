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

module "ec2" {
  source           = "./modules/ec2"
  instance_type    = var.instance_type
  subnet_id        = module.vpc.public_subnet_id
  security_group   = module.security_group.sg_id
  instance_profile = module.iam.instance_profile_name
  user_data        = file("${path.module}/scripts/user_data.sh")
}