terraform {
  backend "s3" {
    bucket = "iac-lab-manu-tfstate"
    region = "us-east-1"
    key = "iac-lab-manu/dev/terraform.tfstate"
    dynamodb_table = "iac-lab-manu-tfstate-locks"
    encrypt = true
  }
}

