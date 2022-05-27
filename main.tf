terraform {
  backend "s3" {
    bucket = "bucket-storing-state-files1"
    key    = "files.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "state_files_bucket" {
  bucket = "bucket-storing-state-files1"
  tags = {
    Name        = "My bucket"
  }
}
resource "aws_instance" "first_server" {
  ami           = "ami-06eecef118bbf9259"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}
