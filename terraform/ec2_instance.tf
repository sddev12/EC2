data "local_file" "public_key" {
  filename = var.public_key_file
}

resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.ec2.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_eip" "instance_eip" {
  instance = aws_instance.main.id
  domain   = "vpc"

  tags = var.tags
}

resource "aws_key_pair" "deployer" {
  key_name   = "ubuntu-ec2"
  public_key = data.local_file.public_key.content
}

resource "aws_instance" "main" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  key_name        = var.key_name
  security_groups = [aws_security_group.instance_sg.id]

  tags = var.tags
}
