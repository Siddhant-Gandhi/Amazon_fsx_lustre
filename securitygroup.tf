module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name                     = var.security_group_name
  vpc_id                   = module.vpc.vpc_id
  ingress_with_cidr_blocks = [var.ingress_rules]
  egress_with_cidr_blocks  = [var.egress_rules]
  tags = {
  Owner = var.owner_tag }
}

