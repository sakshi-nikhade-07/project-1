resource "aws_instance" "ec2demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name = "static-key"
  region = "ap-south-1"
  //count = "2"
  tags = {
    Name = var.name
  }
}

