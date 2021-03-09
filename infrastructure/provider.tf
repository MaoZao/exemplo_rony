provider "aws" {
  region = var.aws_region
}

# backend
terraform {
  backend "s3" {
    bucket = "terraform-439543761220"
    key    = "state/a3tech/exemplo_rony/terraform.tfstate"
    region = "us-east-1"
  }
}