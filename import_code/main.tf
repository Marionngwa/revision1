
resource "aws_instance" "web" {
  ami                                  = "ami-0a699202e5027c10d"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1c"
  cpu_core_count                       = 1
  instance_type                        = "t2.micro"
  key_name                             = "ec2-keypair"
  monitoring                           = false
  subnet_id                            = "subnet-0a5730ba694360cf0"
  tags = {
    Name = "webserver"
  }
  
}
