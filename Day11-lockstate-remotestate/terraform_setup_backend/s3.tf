provider "aws"{
    profile = "Rohit"
    region = "ap-south-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-rohit123-test-bucket"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}