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
  app_citizen_sg_id =  "${module.vpc.app_citizen_sg_id}"
  meta_citizen_sg_id = "${module.vpc.meta_citizen_sg_id}"
  private_app_subnet_id = "${module.vpc.private_app_subnet_id}"
  public_http_meta_subnet_id = "${module.vpc.public_http_meta_subnet_id}"
}

module "elasticache" {
  source = "../elasticache"

  node_type = "${var.node_type}"
  subnet_group_name = "${module.vpc.cache_subnet_group_name}"
}
