module "vpc" {
  source = "../vpc"
  
  availability_zone = "${var.availability_zone}"
  availability_zone2 = "${var.availability_zone2}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
}

module "ec2" {
  source = "../ec2"

  availability_zone = "${var.availability_zone}"
  region = "${var.region}"
  instance_type = "${var.instance_type}"
  public_ssh_subnet_id = "${module.vpc.public_ssh_subnet_id}"
  public_http_app_subnet_id = "${module.vpc.public_http_app_subnet_id}"
  vetted_citizen_sg_id = "${module.vpc.vetted_citizen_sg_id}"
  app_citizen_sg_id =  "${module.vpc.app_citizen_sg_id}"
  meta_citizen_sg_id = "${module.vpc.meta_citizen_sg_id}"
  web_citizen_sg_id = "${module.vpc.web_citizen_sg_id}"
  private_app_subnet_id = "${module.vpc.private_app_subnet_id}"
  public_http_meta_subnet_id = "${module.vpc.public_http_meta_subnet_id}"
}

module "elasticache" {
  source = "../elasticache"

  node_type = "${var.node_type}"
  subnet_group_name = "${module.vpc.cache_subnet_group_name}"
}

module "rds" {
  source = "../rds"

  db_instance_type = "${var.db_instance_type}"
  db_name = "${var.db_name}"
  db_username = "${var.db_username}"
  db_password = "${var.db_password}"
  private_rds_subnet1_id = "${module.vpc.private_rds_subnet1_id}"
  private_rds_subnet2_id = "${module.vpc.private_rds_subnet2_id}"
}
