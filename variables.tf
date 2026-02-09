variable "aws_region" {
  default = "us-east-1"
}

variable "instance_name" {
  default = "windows-baseline"
}

variable "environment" {
  default = "demo"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "windows_ami_id" {
  description = "Windows Server AMI ID"
}

variable "vpc_id" {}
variable "subnet_id" {}
variable "key_name" {}

variable "allowed_rdp_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to RDP"
}

variable "local_admin_user" {
  description = "Custom local admin username"
}

variable "local_admin_pass" {
  description = "Custom local admin password"
  sensitive   = true
}

variable "timezone" {
  default = "Eastern Standard Time"
}
