module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"
  cidr = "192.168.0.0/16"
  # insert the 18 required variables here
}