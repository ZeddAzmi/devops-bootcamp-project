terraform {
  backend "s3" {
    bucket  = "devops-bootcamp-terraform-zeddazmi"
    key     = "global/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}
