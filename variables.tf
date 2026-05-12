variable "vpc_cidr" {
  type = string
  //default = "10.0.0.0/16"
}
variable "vpc_id" {
  type = string
  //default = "vpc-0f7c83be5f7f6b0f5"
}
variable "ami_id" {
  type = string
  //default = "ami-0220d79f3f480ecf5"
}
variable "instance_type" {
  type = string
  //default = "t3.micro"
}
variable "subnet_id" {
  type = string
  //default = "subnet-0753efad3a97c7c32"
}
variable "subnet_cidr" {
  type = string
  //default = "10.0.1.0/24"
}
variable "security_group" {
  type = string
  //default = "sg-0674ace02359e7656"
}
variable "project_name" {
  type = string
}
variable "common_tags" {
  type = map(string)
}
variable "region" {
  type = string
}
variable "owner_id" {
  type = string
}
variable "instance_names" {
  type    = list(string)
  default = ["Jenkins", "Jenkins-Node"]
}