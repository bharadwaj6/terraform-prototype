variable "region" {}

variable "availability_zone" {}

variable "instance_type" {}

variable "public_ssh_subnet_id" {}

variable "private_app_subnet_id" {}

variable "public_http_meta_subnet_id" {}

variable "public_http_app_subnet_id" {}

variable "vetted_citizen_sg_id" {}

variable "meta_citizen_sg_id" {}

variable "app_citizen_sg_id" {}

variable "web_citizen_sg_id" {}

variable "bastion_amis" {
  type = "map"
  default = {
      "ap-south-1" = "ami-007d5db58754fa284"
  }
}

variable "app_server_amis" {
  type = "map"
  default = {
      "ap-south-1" = "ami-007d5db58754fa284"
  }
}

variable "meta_server_amis" {
  type = "map"
  default = {
      "ap-south-1" = "ami-007d5db58754fa284"
  }
}
