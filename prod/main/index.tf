module "vpc" {
  source = "../vpc"
  
  availability_zone = "${var.availability_zone}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
}

module "ec2" {
  source = "../ec2"

  availability_zone = "${var.availability_zone}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
  public_ssh_subnet_id = "${module.vpc.public_ssh_subnet_id}"
  vetted_citizen_sg_id = "${module.vpc.vetted_citizen_sg_id}"
}
