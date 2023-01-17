###########################
## AWS Provider - Main ##
###########################

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAVTJ2JB3HN22RXSHR"
  secret_key = "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"
}

resource "aws_instance" "my-machine" {
  ami           = "ami-0ff39345bd62c82a5"
  instance_type = "t2.micro"
  tags = {
    Name = "TestInstance"
  }
}

output "instance_private_ips" {
  value       = aws_instance.my-machine.private_ip
  description = "The private IP address of the instance."
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.my-machine.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.my-machine.public_ip
}
