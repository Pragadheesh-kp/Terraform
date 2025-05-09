provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

resource "aws_instance" "prgade_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  tags = {
    Name = "prgade-instance1"
  }

  # User data to install Docker, create directory, and clone repositories
  user_data = <<-EOF
              #!/bin/bash
              # Update and install required packages
              sudo apt-get update -y
              # Install Docker
              sudo apt-get install -y docker.io

              # Enable and start Docker service
              sudo systemctl enable docker
              sudo systemctl start docker

              # Add ubuntu user to Docker group
              sudo usermod -aG docker ubuntu

              # Create the directory
              mkdir -p /home/ubuntu/docker

              # Navigate to the directory
              cd /home/ubuntu/docker

              # Pull the two repositories
              git clone https://github.com/Pragadheesh-kp/docker.git
              EOF
}

data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = [var.security_group_name]
  }
}
