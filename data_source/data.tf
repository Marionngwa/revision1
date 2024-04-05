data "aws_ami" "ami1" {
  executable_users = ["self"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "name1" {
  ami = data.aws_ami.name1.id
}

data "aws_instance" "ec21" {
  instance_id = "i-013f3b7d8c79c4d5e"
}