variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.medium"
}

variable "ami" {
  description = "The AMI to use for the instance"
  default     = "ami-09edb498ada567cb6" # Update as needed
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "jenkins" # Replace with your key name
}
