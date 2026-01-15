data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name


  tags = {
    Name = "devops-web-server"
  }
}

resource "aws_instance" "ansible" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.135"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name


  tags = {
    Name = "devops-ansible-controller"
  }
}

resource "aws_instance" "monitoring" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.136"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name


  tags = {
    Name = "devops-monitoring-server"
  }
}
