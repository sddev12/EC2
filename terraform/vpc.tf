resource "aws_vpc" "ec2" {
  cidr_block = "10.0.0.0/28"

  tags = var.tags
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.ec2.id
  cidr_block = "10.0.1.0/29"

  tags = var.tags
}

resource "aws_internet_gateway" "ec2" {
  vpc_id = aws_vpc.ec2.id

  tags = var.tags
}

resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.ec2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_subnet.id
}


