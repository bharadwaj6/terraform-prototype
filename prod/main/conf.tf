variable "access_name" {}
variable "access_key" {}
variable "region" {}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "instance_type" {
  default = "t2.micro"
}


provider "aws" {
  access_key = "${var.access_name}"
  secret_key = "${var.access_key}"
  region     = "${var.region}"
}
