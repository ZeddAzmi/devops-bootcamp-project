terraform {
  backend "s3" {
    bucket = "devops-bootcamp-terraform-dinazmi"
    key    = "state/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
