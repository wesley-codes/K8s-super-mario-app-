resource "aws_vpc" "mario_vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "mario-vpc-dev"
  }
}

resource "aws_subnet" "mario_public_subnet" {
  vpc_id                  = aws_vpc.mario_vpc.id
  cidr_block              = "${var.public_subnet_cidr_block}"
  availability_zone       = "${var.azs}"
  map_public_ip_on_launch = true

  tags = {
    Name = "mario-public-subnet-dev"
  }
}