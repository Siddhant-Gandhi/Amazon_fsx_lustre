#Generalise Owner tag for all the resources
variable "owner_tag" {
  description = "define your owner id"
  type        = string
  default     = "siddhant.gandhi@intuitive.cloud"
}

#Variables for ec2 instance
variable "instance_type" {
  description = "define type of instance you want to launch for mounting fsx for lustre "
  default     = "t2.micro"
  type        = string
}

variable "instance_name" {
  description = "write name of instance you launced"
  default     = "sid-ec2-lustre"
  type        = string
}

variable "monitor_ec2" {
  description = "define if you want to monitor your ec2"
  default     = true
  type        = bool
}

variable "allow_public_ip_for_ec2" {
  description = "define if you want to allow public ip your ec2"
  default     = true
  type        = bool
}

variable "key_pair_name_ec2" {
  description = "define name of your key-pair for ec2 "
  default     = "sid_key_pair"
  type        = string
}

variable "local_filename_ec2" {
  description = "define filename of your local for key-pair "
  default     = "SSH-key-pair.pem"
  type        = string
}

#variables for vpc

variable "vpc_name" {
  description = "define name for your vpc "
  default     = "sid-vpc"
  type        = string
}

variable "cidr_block_vpc" {
  description = "define cidr blcok for your vpc "
  default     = "10.0.0.0/16"
  type        = string
}

variable "availability_zones_vpc" {
  description = "define availability zones for your vpc"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "define cidr blocks for private subnets of your vpc"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type        = list(string)
}

variable "public_subnets_cidr" {
  description = "define cidr blocks for public subnets of your vpc"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "define if you want to enable nat gateway"
  default     = true
  type        = bool
}

variable "create_igw" {
  description = "define if you want to creat internet gateway"
  default     = true
  type        = bool
}

variable "single_nat_gateway" {
  description = "define if you want to creat internet gateway"
  default     = true
  type        = bool
}

variable "one_nat_gateway_per_az" {
  description = "define if you want to creat internet gateway"
  default     = false
  type        = bool
}

variable "igw_tags" {
  description = "give namr to your internet gateway"
  type        = string
  default     = "Sid-igw"
}

variable "nat_gateway_tags" {
  description = "give name to your nat gateway"
  type        = string
  default     = "Sid-nat"
}

variable "public_route_table_tags" {
  description = "give name to your public route table"
  type        = string
  default     = "public-subnet-rtb"
}

variable "private_route_table_tags" {
  description = "give name to your private route table"
  type        = string
  default     = "private-subnet-rtb"
}

variable "private_subnet_tags" {
  description = "give name to your private subnets"
  type        = string
  default     = "prvt-rtb"

}

variable "public_subnet_tags" {
  description = "give name to your public subnets"
  type        = string
  default     = "pub-rtb"
}

#variables for s3

variable "s3_bucket_name" {
  description = "define name of your s3 bucket"
  default     = "sid-s3-fsx"
  type        = string
}

variable "s3_bucket_versioning" {
  description = "define whether you want versioning or not"
  default     = false
  type        = bool
}

variable "block_public_acls" {
  description = "Specifies whether Amazon S3 should block public ACLs for this bucket"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Specifies whether Amazon S3 should block public bucket policies for this bucket"
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Specifies whether Amazon S3 should ignore public ACLs for this bucket"
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Specifies whether Amazon S3 should restrict public bucket policies for this bucket"
  type        = bool
  default     = false
}

#variables for Security group

variable "security_group_name" {
  description = "write name for your security grouop"
  type        = string
  default     = "sid-sg"
}

variable "ingress_rules" {
  description = "define inbound rules for your security group"
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
}

variable "egress_rules" {
  description = "define outbound rules for your security group"
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
}

#variables for Amazon Fsx for Lustre

variable "deployment_cofig_file_system" {
  description = "write your deployment configuration of file system"
  type        = map(any)
  default = {
    per_unit_storage_throughput = "125"
    deployment_type             = "PERSISTENT_2"
    storage_type                = "SSD"
    storage_capacity            = 1200
  }
}

variable "fsx_name" {
  description = "Write name you want to give to your Fsx Lustre"
  type        = string
  default     = "Sidfsx"
}

variable "file_system_version" {
  description = "define your version for file system"
  type        = string
  default     = "2.12"

}


















