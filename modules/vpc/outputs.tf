output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "cidr" {
  description = "The ID of the VPC"
  value       = var.cidr
}

output "public_subnets_list" {
  description = "The Subnet id for EC2"
  value       = module.vpc.public_subnets
}