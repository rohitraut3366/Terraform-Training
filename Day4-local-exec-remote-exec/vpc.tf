resource "aws_vpc" "apache-server-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "apache-webserver"
  }
}

resource "aws_subnet" "public" {
  cidr_block = var.subnet_cidr
  vpc_id     = aws_vpc.apache-server-vpc.id
  availability_zone = var.az

}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.apache-server-vpc.id
  tags = {
    Name = "tf-gatway"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.apache-server-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "rt1"
  }

}

resource "aws_route_table_association" "rt1ass" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt1.id
}

