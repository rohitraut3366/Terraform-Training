provider "aws"{
    profile = "Rohit"
    region = "ap-south-1"
}



data "aws_ami" "web" {

  owners = [ "532773623179" ]
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Component"
    values = ["RedHat"]
  }

  most_recent = true
}