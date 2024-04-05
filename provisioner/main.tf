terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "demo1" {
    ami = "ami-0a699202e5027c10d"
    instance_type = "t2.micro"
    key_name = "ec2-keypair"
    
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./ec2-keypair.pem")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo useradd marion",
      "mkdir terraform",
    ]
  }

  provisioner "file" {
    source = "ec2-keypair.pem"
    destination = "/tmp/key.pem"
  }
  depends_on = [ aws_instance.demo1 ]
}