 provider "aws" 
 {
  version = "2.33.0"
  region = "us-east-2"
}
 
 resource "My_ec2" 
 {
  name                   = "Jenkins"
  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "My-key"
  vpc_security_group_id = "sg-02e0eb08f5a91c0f6"
  subnet_id              = "subnet-490da022"

  provisioner"local-exec"
  {
      command = "sudo apt-get update" 
      command = "sudo apt-get install open-jdk"
      command = "sudo apt-get install jenkins" 
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}