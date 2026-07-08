provider "aws" {
  region          = "sa-east-1"
}

resource "aws_security_group" "securitygroup" {
  name            = "secutirygroup"
  description     = "Permitir acesso http e acesso a internet"

  ingress {
    from_port     = 80
    to_port       = 80
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  ingress {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  egress {
    from_port     = 0
    to_port       = 65535
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name = "terraform-keypar"
  public_key = file("~/keys/AWS.pub")
}

resource "aws_instance" "servidor" {
  ami             = "ami-0de8ccbb3a0a00dba"
  instance_type   = "t2.nano"
  user_data       = file("user_data.sh")
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
}