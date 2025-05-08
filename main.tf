provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

resource "aws_instance" "prgade_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  tags = {
    Name = "prgade-instance1"
  }
}

data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = [var.security_group_name]
  }
}
