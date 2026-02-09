# Terraform Windows Baseline (AWS EC2)

This repository provisions a Windows EC2 instance with a security-focused baseline applied at first boot using PowerShell `user_data`.

## Baseline Applied

1. Enable Windows Update (automatic install)
2. Enable Microsoft Defender (real-time protection)
3. Enable Windows Firewall (all profiles)
4. Create a non-default local administrator and disable built-in Administrator
5. Ensure AWS SSM agent is running (no inbound management required)

## Requirements

- Terraform >= 1.5
- AWS credentials via environment variables
- Existing VPC and Subnet
- Existing EC2 key pair

## Usage

```bash
terraform init
terraform apply
