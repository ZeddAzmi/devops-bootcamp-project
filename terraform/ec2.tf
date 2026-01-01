resource "aws_instance" "web" {
  ami           = "ami-ubuntu-24"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  private_ip    = "10.0.0.5"
  vpc_security_group_ids = [aws_security_group.public.id]
  tags = { Name = "web-server" }
}
