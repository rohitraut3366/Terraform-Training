provider "aws" {
  profile = "Rohit"
  region = "ap-south-1"
}

variable "instance_type" {
    type = map
    default = {
        dev = "t2.micro"
        test = "t2.small"
        prod = "t2.large"
    }
  
}

output "workspace" {
    value = terraform.workspace
}

output "type" {
  value = lookup(var.instance_type, terraform.workspace)
}
/*
terraform workspace list
terraform workspace show
terraform workspace new dev
terraform workspace select dev
*/