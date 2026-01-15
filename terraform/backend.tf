terraform {
  backend "s3" {
    bucket = "devops-bootcamp-terraform-zeddazmi"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
