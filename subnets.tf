resource "aws_subnet" "PublicAZA" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.Subnet-Public-AzA-CIDR
  tags = {
    Name = "2a-PublicSubnet"
  }
}
resource "aws_subnet" "PrivateAZA" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.Subnet-Private-AzA-CIDR
  availability_zone = "us-east-1a"
  tags = {
    Name = "2a-PrivateSubnet"
  }
}
resource "aws_subnet" "PublicAZB" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.Subnet-Public-AzB-CIDR
  tags = {
    Name = "2b-PublicSubnet"
  }
}
resource "aws_subnet" "PrivateAZB" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.Subnet-Private-AzB-CIDR
  availability_zone = "us-east-1b"
  tags = {
    Name = "2b-PrivateSubnet"
  }
}
