variable "availability_zone" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {}


variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_ssh_subnet_cidr" {
    description = "CIDR for the Public Subnet for SSH"
    default = "10.0.0.0/19"
}

variable "public_http_meta_subnet_cidr" {
    description = "CIDR for the Public Subnet for meta server"
    default = "10.0.32.0/19"
}

variable "public_http_app_subnet_cidr" {
    description = "CIDR for the Public Subnet for App ELBs"
    default = "10.0.64.0/18"
}

variable "private_rds_subnet_cidr" {
    description = "CIDR for the Private Subnet for app db servers"
    default = "10.0.128.0/19"
}

variable "private_meta_rds_subnet_cidr" {
    description = "CIDR for the Private Subnet for Meta db servers"
    default = "10.0.160.0/19"
}

variable "private_app_subnet_cidr" {
    description = "CIDR for the Private Subnet with App servers"
    default = "10.0.192.0/18"
}

variable "nat_amis" {
  type = "map"
  default = {
      # these are special AMIs preconfigured to do NAT
      "ap-south-1" = "ami-00b3aa8a93dd09c13"
  }
}
