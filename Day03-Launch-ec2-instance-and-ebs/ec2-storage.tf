provider "aws" {
  region  = "ap-south-1"
  profile = "Rohit"
}

resource "aws_instance" "dev" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  tags = {
    Name = "dev"
  }
}
output "dev-server" {
  value = aws_instance.dev.availability_zone

}

resource "aws_ebs_volume" "volume1" {
  availability_zone = aws_instance.dev.availability_zone
  size              = 10
  tags = {
    Name = "ebs-for-dev-webservermount"
  }
}

resource "aws_volume_attachment" "volume_attachment" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.dev.id
  volume_id   = aws_ebs_volume.volume1.id
}
