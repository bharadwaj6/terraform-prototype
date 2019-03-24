variable "access_name" {}
variable "access_key" {}
variable "region" {}

variable "availability_zone" {}

variable "availability_zone2" {}

variable "instance_type" {}

variable "node_type" {}

variable "db_instance_type" {}

variable "db_name" {}

variable "db_username" {}

variable "db_password" {}


provider "aws" {
  access_key = "${var.access_name}"
  secret_key = "${var.access_key}"
  region     = "${var.region}"
}
