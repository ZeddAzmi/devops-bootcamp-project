resource "aws_instance" "web" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/ubuntu/.ssh
              echo "ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJaBw/oUC/fUy/N28BTyIKeDYVgkTJ04+oC8DuM0X/LL" >> /home/ubuntu/.ssh/authorized_keys
              chown -R ubuntu:ubuntu /home/ubuntu/.ssh
              chmod 700 /home/ubuntu/.ssh
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              EOF
              
  private_ip    = "10.0.0.5"

  vpc_security_group_ids = [aws_security_group.public.id]

  tags = {
    Name = "web-server"
  }
}


resource "aws_instance" "ansible" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id
  private_ip    = "10.0.0.135"

  vpc_security_group_ids = [aws_security_group.private.id]

  tags = {
    Name = "ansible-controller"
  }
}


resource "aws_instance" "monitoring" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/ubuntu/.ssh
              echo "ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJaBw/oUC/fUy/N28BTyIKeDYVgkTJ04+oC8DuM0X/LL" >> /home/ubuntu/.ssh/authorized_keys
              chown -R ubuntu:ubuntu /home/ubuntu/.ssh
              chmod 700 /home/ubuntu/.ssh
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              EOF
  private_ip    = "10.0.0.136"

  vpc_security_group_ids = [aws_security_group.private.id]

  tags = {
    Name = "monitoring-server"
  }
}

