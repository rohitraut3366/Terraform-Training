provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}
resource "tls_private_key" "key" {
  algorithm   = var.key_algo
  ecdsa_curve = var.key_length
}

resource "aws_key_pair" "key_reg" {
  key_name   = var.ec2_instance_key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "save_private_file" {
  content  = tls_private_key.key.private_key_pem
  filename = var.ec2_instance_key_name
}


resource "aws_security_group" "web_sg" {
  name        = "webserver"
  description = "security group fro webserver"
  vpc_id      = "${aws_vpc.apache-server-vpc.id}"
  dynamic "ingress" {
    for_each = var.webserver_sg_ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "webserver" {
  ami           = "ami-010aff33ed5991201"
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name = var.ec2_instance_key_name
  count = var.instance_count
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "Webserver"
  }
}