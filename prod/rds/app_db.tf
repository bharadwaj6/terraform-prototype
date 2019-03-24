resource "aws_db_instance" "app-db" {
#   allocated_storage    = 100
  allocated_storage    = 20
  storage_type         = "gp2"
#   storage_type = "io1"
#   iops = 1000
  engine               = "postgres"
  engine_version       = "9.6.11"
  instance_class       = "${var.db_instance_type}"
  name                 = "${var.db_name}"
  username             = "${var.db_username}"
  password             = "${var.db_password}"
  parameter_group_name = "default.postgres9.6"
  db_subnet_group_name = "${aws_db_subnet_group.app-db.id}"
}

resource "aws_db_subnet_group" "app-db" {
  name       = "app-db"
  subnet_ids = ["${var.private_rds_subnet1_id}", "${var.private_rds_subnet2_id}"]

  tags = {
    Name = "App DB subnet group"
  }
}
