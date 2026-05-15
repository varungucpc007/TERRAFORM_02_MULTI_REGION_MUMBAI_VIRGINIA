resource "aws_vpc" "mumbai_vpc" {
  provider   = aws.mumbai
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "mumbai-vpc"
  }
}

resource "aws_subnet" "mumbai_public" {
  provider                = aws.mumbai
  vpc_id                  = aws_vpc.mumbai_vpc.id
  cidr_block              = var.subnet_public_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "mumbai-public-subnet"
  }
}

resource "aws_security_group" "mumbai_sg" {
  provider = aws.mumbai
  vpc_id  = aws_vpc.mumbai_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "mumbai_ami" {
  provider    = aws.mumbai
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "mumbai_ec2" {
  provider        = aws.mumbai
  ami             = data.aws_ami.mumbai_ami.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.mumbai_public.id
  security_groups = [aws_security_group.mumbai_sg.id]

  tags = {
    Name = "Mumbai-EC2"
  }
}

resource "aws_vpc" "virginia_vpc" {
  provider   = aws.virginia
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "virginia-vpc"
  }
}
resource "aws_subnet" "virginia_public" {
  provider                = aws.virginia
  vpc_id                  = aws_vpc.virginia_vpc.id
  cidr_block              = var.subnet_public_cidr_block
  map_public_ip_on_launch = true

  availability_zone = "us-east-1a"

  tags = {
    Name = "virginia-public-subnet"
  }
}
resource "aws_security_group" "virginia_sg" {
  provider = aws.virginia
  vpc_id  = aws_vpc.virginia_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_ami" "virginia_ami" {
  provider    = aws.virginia
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
resource "aws_instance" "virginia_ec2" {
  provider        = aws.virginia
  ami             = data.aws_ami.virginia_ami.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.virginia_public.id
  security_groups = [aws_security_group.virginia_sg.id]

  tags = {
    Name = "Virginia-EC2"
  }
}