resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = var.instance_type

  tags = {
    Name = "sd"
  }
}