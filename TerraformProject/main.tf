provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-014d544cfef21b42d"
  instance_type = "t2.micro"
  
  tags = {
    Name = "ShreyInstance"
  }
}

data "aws_instance" "example_instance" {
  instance_id = aws_instance.example.id
}

output "instance_public_ip" {
  value = data.aws_instance.example_instance.public_ip
}

output "instance_name" {
  value = aws_instance.example.tags["Name"]
}

output "instance_id" {
  value = aws_instance.example.id
}