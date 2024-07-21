terraform {
  backend "s3" {
    bucket = "devopsb29remotestate"
    key    = "aws-terraform.tfstate"
    region = "us-east-1"
  }
}
