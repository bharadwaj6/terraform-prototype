variable "access_name" {}
variable "access_key" {}
variable "region" {}

provider "aws" {
  access_key = "${var.access_name}"
  secret_key = "${var.access_key}"
  region     = "${var.region}"
}
