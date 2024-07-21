data "aws_vpc" "awsb28vpc" {
  id = "vpc-0eac6d4d55868caa8"
}

data "aws_subnets" "awsb28vpcsubnets" {
  filter {
    name   = "vpc-id"
    values = ["vpc-0eac6d4d55868caa8"]
  }
}

data "aws_security_group" "awsb28sg" {
  id = "sg-0b40e2140d51ecf9f"
}
resource "aws_subnet" "awsb28-subnet10-public" {
  vpc_id            = data.aws_vpc.awsb28vpc.id
  cidr_block        = "10.40.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Datasource-Public-Subnet-1"
  }
}

resource "aws_subnet" "awsb28-subnet11-public" {
  vpc_id            = data.aws_vpc.awsb28vpc.id
  cidr_block        = "10.40.101.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Datasource-Public-Subnet-2"
  }
}

resource "aws_subnet" "awsb28-subnet12-public" {
  vpc_id            = data.aws_vpc.awsb28vpc.id
  cidr_block        = "10.40.103.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Datasource-Public-Subnet-3"
  }
}

data "aws_ami" "my_ami" {
  most_recent = true
  name_regex  = "^AWSB41"
  owners      = ["721834156908"]
}

data "aws_subnet" "public-subnet-1" {
  id = "subnet-0d124b5eb12011584"
}

resource "aws_instance" "web-1" {
  #ami = var.imagename
  #ami = "ami-0d857ff0f5fc4e03b"
  ami                         = data.aws_ami.my_ami.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.public-subnet-1.id
  vpc_security_group_ids      = ["${data.aws_security_group.awsb28sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
}
