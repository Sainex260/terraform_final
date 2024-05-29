# Configure the AWS provider
provider "aws" {
  region = "ap-south-1"
}

# Create a security group
resource "jenkins_sg2" "instance" {
  vpc_id = vpc-013a3c69

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg2"
  }
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-09edb498ada567cb6" # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.medium"
  subnet_id     = subnet-e8240b80
  security_groups = [jenkins_sg2]

  tags = {
    Name = "SSPwebdeployment"
  }

  # Add a key pair (replace with your key name)
  key_name = "jenkins"
}
