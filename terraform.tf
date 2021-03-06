terraform {
  backend "remote" {
    organization = "mark-one"

    workspaces {
      name = "terraform-cloud-test"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  # vpc_security_group_ids = ["sg-0077..."]
  # subnet_id = "subnet-923a..."
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}