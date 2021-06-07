variable "region" {
  type = string
  default = "ap-south-1"
}

variable "ami" {
  type = map
  default = {
      us-east-1 = "ami-2321"
      ap-south-1 = "ami-21263asdjasd"
      us-west-1 = "ami-1111"
  }
}

output "us-east-1" {
    value = lookup(var.ami, "us-east-1", "what?")
}

output "wrong" {
    value = lookup(var.ami, "us", "what?")
}

output "ap-south-1" {
  value = lookup(var.ami, "ap-south-1", "what?")
}