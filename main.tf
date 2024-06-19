# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-09edb498ada567cb6" # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.medium"

  tags = {
    Name = "SSPwebdeployment"
  }
}
