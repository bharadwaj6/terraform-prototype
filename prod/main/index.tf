module "vpc" {
  source = "../vpc"
  
  availability_zone = "${var.availability_zone}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
}

# module "ec2" {
#   source = "../ec2"

#   availability_zone = "${var.availability_zone}"
#   region = "${var.region}"
#   instance_type = "${var.instance_type}"
#   public_ssh_subnet_id = "${module.vpc.public_ssh_subnet_id}"
#   public_subnet_ssh_sg_id = "${module.vpc.public_subnet_ssh_sg_id}"
# }
