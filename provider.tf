terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}