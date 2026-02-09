
---

## `main.tf`

```hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "windows" {
  name        = "${var.instance_name}-sg"
  description = "Windows baseline security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.allowed_rdp_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "windows" {
  ami                    = var.windows_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.windows.id]
  key_name               = var.key_name

  user_data = templatefile("${path.module}/userdata.ps1.tftpl", {
    local_admin_user = var.local_admin_user
    local_admin_pass = var.local_admin_pass
    timezone         = var.timezone
  })

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
