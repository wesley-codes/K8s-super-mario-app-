resource "aws_vpc" "mario_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "mario-vpc-dev"
  }
}

resource "aws_subnet" "mario_public_subnet" {
  vpc_id                  = aws_vpc.mario_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.azs
  map_public_ip_on_launch = true

  tags = {
    Name = "mario-public-subnet-dev"
  }
}

resource "aws_subnet" "mario_private_subnet" {
  vpc_id                  = aws_vpc.mario_vpc.id
  cidr_block              = var.private_subnet_cidr_block
  availability_zone       = var.azs
  map_public_ip_on_launch = false

  tags = {
    Name = "mario-private-subnet-dev"
  }

}

resource "aws_internet_gateway" "mario_gw" {
  vpc_id = aws_vpc.mario_vpc.id

  tags = {
    Name = "mario-igw-dev"
  }

}

resource "aws_eip" "mario_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "mario-nat-eip-dev"
  }

}

resource "aws_nat_gateway" "mario_nat_gateway" {
  allocation_id = aws_eip.mario_nat_eip
  subnet_id     = aws_subnet.mario_public_subnet.id

  tags = {
    Name = "mario-nat-gw-gw"
  }

  depends_on = [aws_internet_gateway.mario_gw]
}


resource "aws_route_table" "mario_public_route_table" {
  vpc_id = aws_vpc.mario_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mario_gw.id
  }


  tags = {
    Name = "mario-public-rt"
  }
}

resource "aws_route_table" "mario_private_route_table" {
  vpc_id = aws_vpc.mario_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mario_nat_gateway.id
  }

  tags = {
    Name = "mario-private-rt"
  }
}