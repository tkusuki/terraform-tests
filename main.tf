provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 2
  ami = var.amis.us-east-1
  instance_type = "t2.micro"
  key_name  = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}

resource "aws_instance" "dev4" {
  ami = var.amis.us-east-1
  instance_type = "t2.micro"
  key_name  = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "terraform-course-dev4"
  acl    = "private"

  tags = {
    Name        = "terraform-course-dev4"
  }
}

resource "aws_s3_bucket" "homologacao" {
  bucket = "tkusuki-homologacao"
  acl    = "private"

  tags = {
    Name        = "tkusuki-homologacao"
  }
}
