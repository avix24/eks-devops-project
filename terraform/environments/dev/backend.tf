terraform {
  backend "s3" {
    bucket         = "eks-project-tfstate-avi"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "eks-project-tf-locks"
    encrypt        = true
  }
}