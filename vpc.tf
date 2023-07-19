module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr_block_vpc


  azs             = var.availability_zones_vpc
  private_subnets = var.private_subnets_cidr
  public_subnets  = var.public_subnets_cidr

  create_igw             = var.create_igw
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  nat_gateway_tags = {
    Name  = var.nat_gateway_tags
    Owner = var.owner_tag
  }

  igw_tags = {
    Name  = var.igw_tags
    Owner = var.owner_tag
  }

  public_route_table_tags = {
    Name  = var.public_route_table_tags
    Owner = var.owner_tag
  }

  private_route_table_tags = {
    Name = var.private_route_table_tags
  Owner = var.owner_tag }

  tags = {
    Owner = var.owner_tag
  }

  private_subnet_tags = {
    Name  = var.private_subnet_tags
    Owner = var.owner_tag
  }

  public_subnet_tags = {
    Name  = var.public_subnet_tags
    Owner = var.owner_tag
  }
}



