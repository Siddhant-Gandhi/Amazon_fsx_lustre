module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.instance_name
  
  count = 3

  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key_pair.id
  monitoring                  = var.monitor_ec2
  vpc_security_group_ids      = [module.security_group.security_group_id]
  subnet_id                   = module.vpc.public_subnets[count.index]
  associate_public_ip_address = var.allow_public_ip_for_ec2

  tags =  {
    Owner = var.owner_tag
    Name  = "sid-ec2-${var.availability_zones_vpc[count.index]}"
  }
}



resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name_ec2
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.local_filename_ec2
}

