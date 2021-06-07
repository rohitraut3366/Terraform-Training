provider "aws"{
    profile = "Rohit"
    region = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket = "my-tf-rohit123-test-bucket"
    key    = "cr.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tfstate-lock-table"
  }
  
}