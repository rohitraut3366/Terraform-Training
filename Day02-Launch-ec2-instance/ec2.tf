provider "aws" {
  region = "ap-south-1"
  profile = "Rohit"
}

resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}