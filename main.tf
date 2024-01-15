terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  cidr = module.vpc.cidr
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets_list = module.vpc.public_subnets_list
  security_group_id = module.security_group.security_group_id
}

module "asg" {
  source = "./modules/asg"
  launch_configuration_name = module.ec2.launch_configuration_name
  lb_id = module.alb.lb_id
  public_subnets_list = module.vpc.public_subnets_list
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
}

