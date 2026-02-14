terraform {
  backend "s3" {
    bucket         = "amzn-mario-bucket"
    key            = "EKS/terraform.tfstate"
    region         = "eu-north-1"
  }
}