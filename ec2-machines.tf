data "aws_ami" "ion_ami" {
  most_recent = true
  owners = ["self"]

  name_regex = "^ion-packer-.........."
}

resource "aws_instance" "webapp1" {
  ami                         = data.aws_ami.ion_ami.id
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.PublicAZA.id
  vpc_security_group_ids      = [aws_security_group.WebServer.id]

  key_name                    = var.key_name
  tags = {
    Name = "ion-WebApp1-Jayant12"
  }

  depends_on = [aws_internet_gateway.gw]

 
  
}
