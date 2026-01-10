resource "aws_key_pair" "devops" {
  key_name   = "devops-key"
  public_key = var.ssh_public_key
}
