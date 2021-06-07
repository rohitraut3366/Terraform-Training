# Provider
variable "aws_region" {}

# server network setup
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "az" {}

# server details
variable "webserver_sg_ingress_ports" {}
variable "instance_count" {}
variable "instance_type" {
    type = map
    default ={
        dev = "t2.micro"
        test = "t2.small"
        prod = "t2.large"
    }
}

# server key
variable "ec2_instance_key_name" {}
variable "key_algo" {}
variable "key_length" {}


