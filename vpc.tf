resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc-fullcidr

  #### this 2 true values are for use the internal vpc dns resolution
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ion-vpc"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Main route table"
  }
}
resource "aws_route_table" "RT1" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "Subnet route table"
  }
}
resource "aws_main_route_table_association" "x" {
  vpc_id         = aws_vpc.mainvpc.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.PublicAZA.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.PrivateAZA.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.PrivateAZB.id
  route_table_id = aws_route_table.RT.id
}
