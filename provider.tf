terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAXHG6J7G4QTXT6GZA"
  secret_key = "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"
}
