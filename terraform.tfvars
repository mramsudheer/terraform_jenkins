project_name = "Roboshop"
common_tags = {
  Environment = "dev"
  Terraform   = "true"
  component   = "bastion"
}
region         = "us-east-1"
ami_id         = "ami-0220d79f3f480ecf5" # Redhat-9-DevOps-Practice
instance_type  = "t3.micro"
owner_id       = "973714476881"
security_group = "sg-0674ace02359e7656"
subnet_cidr    = "10.0.1.0/24"
subnet_id      = "subnet-0753efad3a97c7c32"
vpc_id         = "vpc-0f7c83be5f7f6b0f5"
vpc_cidr       = "10.0.0.0/16"
