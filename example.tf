provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0a58e22c727337c51" # Amazon Linux 2 AMI 2.0.20200617.0 x86_64 HVM gp2
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
