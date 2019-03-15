module "vpc" {
  source = "../vpc"
  
  availability_zone = "${var.availability_zone}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
}
