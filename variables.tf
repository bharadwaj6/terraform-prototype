variable "access_name" {}
variable "access_key" {}
variable "region" {}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-0de53d8956e8dcf80"
    "us-west-2" = "ami-4b32be2b"
    "ap-south-1" = "ami-0889b8a448de4fc44"
  }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}