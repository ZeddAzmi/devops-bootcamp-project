resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/24"
  tags = { Name = "devops-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = { Name = "devops-public-subnet" }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.128/25"
  tags = { Name = "devops-private-subnet" }
}
