terraform {
  backend "s3" {
    bucket = "test-bucket"
    key = "test-bucket.tfstate"
    region = "ap-south-1"
    profile = "default"
  }
}