# Terraform-aws-server
"Infrastructure as Code for AWS server deployment using Terraform"
# Terraform AWS Server

This repository contains Terraform configurations to deploy an EC2 instance and related infrastructure in AWS.

## Architecture

This Terraform configuration creates:
- A VPC with a public subnet
- An Internet Gateway and route table
- A security group allowing SSH access
- An EC2 instance (t2.micro by default)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0+)
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- AWS account with appropriate permissions

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/sumanthlagadapati/terraform-aws-server.git
   cd terraform-aws-server
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review the deployment plan:
   ```
   terraform plan
   ```

4. Apply the configuration:
   ```
   terraform apply
   ```

5. When finished, destroy the resources:
   ```
   terraform destroy
   ```

## Configuration

You can customize the deployment by modifying the variables in `variables.tf` or by creating a `terraform.tfvars` file:

```hcl
aws_region    = "us-west-2"
instance_type = "t3.micro"
ami_id        = "ami-12345678"
vpc_cidr      = "10.0.0.0/16"
subnet_cidr   = "10.0.1.0/24"
instance_name = "my-custom-server"
```

## Security Note

The default configuration allows SSH access from any IP address (0.0.0.0/0). For production use, restrict this to specific IP addresses.

## Outputs

After successful deployment, the following outputs are available:
- Instance ID
- Instance public IP address
- VPC ID
- Subnet ID
- Security group ID

## License

MIT

## Author

sumanth