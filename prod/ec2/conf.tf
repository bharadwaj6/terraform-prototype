variable "region" {}

variable "availability_zone" {}

variable "instance_type" {}

variable "public_ssh_subnet_id" {}

variable "public_subnet_ssh_sg_id" {}


variable "bastion_amis" {
  type = "map"
  default = {
      "ap-south-1" = "ami-007d5db58754fa284"
  }
}