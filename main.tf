# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-09edb498ada567cb6" # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.medium"
  subnet_id     = "subnet-e8240b80"
  vpc_security_group_ids = [aws_security_group.jenkins_sg2.id]

  tags = {
    Name = "SSPwebdeployment"
  }

  # Add a key pair (replace with your key name)
  key_name = "jenkins"
}
