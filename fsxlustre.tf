resource "aws_fsx_lustre_file_system" "fsx_lustre" {

  subnet_ids                  = [module.vpc.public_subnets[0]]
  security_group_ids          = [module.security_group.security_group_id]
  storage_capacity            = var.deployment_cofig_file_system.storage_capacity
  deployment_type             = var.deployment_cofig_file_system.deployment_type
  storage_type                = var.deployment_cofig_file_system.storage_type
  per_unit_storage_throughput = var.deployment_cofig_file_system.per_unit_storage_throughput
  file_system_type_version    = var.file_system_version


  tags = {
    Owner = var.owner_tag
    Name  = var.fsx_name
  }
}


resource "aws_fsx_data_repository_association" "fsx_association" {
  file_system_id       = aws_fsx_lustre_file_system.fsx_lustre.id
  data_repository_path = "s3://${module.s3_bucket.s3_bucket_id}"
  file_system_path     = "/sid"

  s3 {
    auto_export_policy {
      events = ["NEW", "CHANGED", "DELETED"]
    }

    auto_import_policy {
      events = ["NEW", "CHANGED", "DELETED"]
    }
  }
  provisioner "local-exec" {
    command = <<EOF
      aws fsx create-data-repository-task  --file-system-id ${aws_fsx_lustre_file_system.fsx_lustre.id} --type IMPORT_METADATA_FROM_REPOSITORY --path s3://sid-s3-fsx  --report Enabled=false    
    EOF
  }
}


