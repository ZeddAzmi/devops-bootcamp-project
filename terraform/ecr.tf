resource "aws_ecr_repository" "final_project" {
  name = "devops-bootcamp/final-project-zeddazmi"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "devops-final-project"
  }
}
