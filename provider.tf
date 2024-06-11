terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      ManageBy = "Terraform"
      Project = var.prefix
      Environment = "Dev"
    }
  }
}
