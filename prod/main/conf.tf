variable "access_name" {}
variable "access_key" {}
variable "region" {}

variable "availability_zone" {}

variable "instance_type" {}

variable "node_type" {}



provider "aws" {
  access_key = "${var.access_name}"
  secret_key = "${var.access_key}"
  region     = "${var.region}"
}
