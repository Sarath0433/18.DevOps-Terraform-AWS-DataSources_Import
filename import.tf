resource "aws_vpc" "awsb39vpc" {
  cidr_block           = "10.39.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "AWSB39-VPC"
  }
}

resource "aws_instance" "import-web-1" {
  ami                         = "ami-0149b2da6ceec4bb0"
  instance_type               = "t2.micro"
  key_name                    = "LaptopKey"
  subnet_id                   = "subnet-0a406634baf4d502c"
  associate_public_ip_address = true
  tags = {
    Name = "ImportTesting"
  }
  launch_template {
    #id      = "lt-037a8c17eb984dafb"
    name    = "Ubuntu_20_04_Machine_With_Docker"
    version = "2"
  }
}