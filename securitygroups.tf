resource "aws_security_group" "WebServer" {
  name = "WebServer"
  tags = {
    Name = "WebServer-SG"
  }
  description = "ONLY HTTP CONNECTION INBOUD"
  vpc_id      = aws_vpc.mainvpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
