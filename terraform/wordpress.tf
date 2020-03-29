provider "aws" {
  region = "eu-central-1"

}
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "epam_uni_lab"
}
variable "number_of_instances" {
  description = "Number of instances to make"
  default     = "1"
}
variable "createdby" {
  description = "Created by"
  default     = "Oleksandr Briukhanov"
}


resource "aws_instance" "epam-ec2wordpress" {
  count         = var.number_of_instances
  ami           = "ami-0291bc51c8b3e4f17"
  instance_type = "t2.micro"
  key_name      = "wibob-Frankfurt-aws"
  # security_groups = ["${aws_security_group.wordpress_sg.name}"]
  vpc_security_group_ids = ["${aws_security_group.wordpress_sg.id}"]
  subnet_id              = "${aws_subnet.epam_public_subnet.id}"
  tags = {
    Name       = "${lower(var.name)}-ec2-${count.index + 1}"
    Created_by = var.createdby
  }
}
resource "aws_subnet" "epam_public_subnet" {
  vpc_id            = "${aws_vpc.epam_lab_vpc.id}"
  cidr_block        = "10.10.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "epam lab public subnet"
  }
}

# #    provisioner "remote-exec" {
# #    inline = [
# #      "sudo apt-get update",
# #      "sudo apt-get install -y python",
# #    ]
# #    }
# #    connection {
# #      host          = self.public_ip
# #      type          = "ssh"
# #      user          = "ubuntu"
# #      password      = ""
# #      private_key   = file("~/.ssh/wibob-Frankfurt-aws.pem")
# #    }
#

resource "aws_security_group" "wordpress_sg" {
  name        = "allow_http_ssh_https"
  description = "Allow HTTP,HTTPS,ssh inbound traffic"
  vpc_id      = "${aws_vpc.epam_lab_vpc.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_vpc" "epam_lab_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "epam_lab_vpc"
  }
}
# output "public_dns" {
#   description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
#   value       = aws_instance.lux-ec2amazon.*.public_dns
# }
# output "name" {
#   description = "List of key names of instances"
#   value       = aws_instance.lux-ec2amazon.*.tags.Name
# }
# output "public_ip" {
#   description = "List of public IP addresses assigned to the instances, if applicable"
#   value       = aws_instance.lux-ec2amazon.*.public_ip
# }
# output "private_ip" {
#   description = "List of private IP addresses assigned to the instances"
#   value       = aws_instance.lux-ec2amazon.*.private_ip
# }
