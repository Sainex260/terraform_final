terraform {
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

terraform {
  required_providers {
    jenkins = {
      source  = "registry.terraform.io/hashicorp/jenkins"
      version = "~> 1.0"
    }
  }
}

provider "jenkins" {
  # Configuration options for the Jenkins provider
  url      = "http://13.234.231.247:8080/jenkins"
  username = "admin"
  password = "admin@123"
}
