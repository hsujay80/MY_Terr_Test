 provider "aws" {
  version = "2.33.0"
  region = "us-east-2"
}
 
 resource "aws_instance" "My_Ec2"{
  ami                    = "ami-0ebc8f6f580a04647"
  instance_type          = "t2.micro"
  key_name               = "My-key"
  subnet_id              = "subnet-490da022"

  provisioner"local-exec" {
      command = "sudo apt-get update" 
   }
  
  provisioner"local-exec" {
         command = "sudo apt-get install open-jdk"
   }
  
  provisioner"local-exec" {
      command = "sudo apt-get install jenkins" 
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
