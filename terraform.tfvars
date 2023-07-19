owner_tag = "siddhant.gandhi@intuitive.cloud"

#Define values for your EC2 variable block

instance_type           = "t2.micro"
instance_name           = "sid-ec2-lustre"
key_pair_name_ec2       = "sid_key_pair"
local_filename_ec2      = "SSH-key-pair.pem"
monitor_ec2             = true
allow_public_ip_for_ec2 = true

#define values for your vpc variable block

vpc_name                 = "sid-vpc"
cidr_block_vpc           = "10.0.0.0/16"
availability_zones_vpc   = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets_cidr     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets_cidr      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
igw_tags                 = "Sid-igw"
nat_gateway_tags         = "Sid-nat"
public_route_table_tags  = "public-subnet-rtb"
private_route_table_tags = "private-subnet-rtb"
private_subnet_tags      = "prvt-rtb"
public_subnet_tags       = "pub-rtb"
enable_nat_gateway       = true
create_igw               = true
single_nat_gateway       = true
one_nat_gateway_per_az   = true


#define values for your S3 variable block

s3_bucket_name          = "sid-s3-fsx"
s3_bucket_versioning    = false
block_public_acls       = false
block_public_policy     = false
ignore_public_acls      = false
restrict_public_buckets = false

#define values for your Fsx Lustre variable block

deployment_cofig_file_system = {
  per_unit_storage_throughput = "125"
  deployment_type             = "PERSISTENT_2"
  storage_type                = "SSD"
  storage_capacity            = 1200
}
fsx_name            = "Sidfsx"
file_system_version = "2.12"

##define values for your security group variable block

security_group_name = "sid-sg"

ingress_rules = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = "0.0.0.0/0"
}

egress_rules = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = "0.0.0.0/0"
}



