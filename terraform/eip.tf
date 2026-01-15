resource "aws_eip" "web_eip" {
  domain   = "vpc"
  instance = aws_instance.web.id

  tags = {
    Name = "devops-web-eip"
  }
}
