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
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/18"
}

variable "public_http_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.64.0/18"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.128.0/17"
}

variable "nat_amis" {
  type = "map"
  default = {
      # these are special AMIs preconfigured to do NAT
      "ap-south-1" = "ami-00b3aa8a93dd09c13"
  }
}
