 provider "aws" {
  version = "2.33.0"
  region = "us-east-2"
}
 
 resource "aws_instance" "My Ec2"{
  name                   = "Jenkins"
  ami                    = "ami-0ebc8f6f580a04647"
  instance_type          = "t2.micro"
  key_name               = "My-key"
  vpc_security_group_id  = "sg-02e0eb08f5a91c0f6"
  subnet_id              = "subnet-490da022"

  provisioner"local-exec" {
      command = "sudo apt-get update" 
      command = "sudo apt-get install open-jdk"
      command = "sudo apt-get install jenkins" 
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
