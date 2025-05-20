output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = aws_subnet.private[*].id
}

output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.app_server[*].id
}

output "ec2_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.app_server[*].public_ip
}

output "ec2_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.app_server[*].private_ip
}

output "ssh_connection_strings" {
  description = "SSH connection strings for the EC2 instances"
  value = [
    for instance in aws_instance.app_server :
    "ssh -i ${var.key_name}.pem ec2-user@${instance.public_ip}"
  ]
}

output "nat_gateway_ip" {
  description = "Elastic IP address of the NAT Gateway (if enabled)"
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : "NAT Gateway not enabled"
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket (if created)"
  value       = var.create_s3_bucket ? aws_s3_bucket.storage[0].id : "S3 bucket not created"
}

output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket (if created)"
  value       = var.create_s3_bucket ? aws_s3_bucket.storage[0].arn : "S3 bucket not created"
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.ec2.id
}