resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

/*
  Public Subnets
*/
resource "aws_subnet" "public_subnet_http_app" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_http_app_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public Subnet HTTP App"
    }
}

resource "aws_subnet" "public_subnet_http_meta" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_http_meta_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public Subnet HTTP Meta"
    }
}

resource "aws_subnet" "public_subnet_ssh" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_ssh_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public Subnet SSH"
    }
}

/*
  Private Subnets
*/
resource "aws_subnet" "private_app_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_app_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Private Subnet for App servers"
    }
}

resource "aws_elasticache_subnet_group" "private_app_subnet" {
  name = "app-cache-subnet"
  subnet_ids = ["${aws_subnet.private_app_subnet.id}"]
}


resource "aws_subnet" "private_rds_subnet1" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_rds_subnet1_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Private Subnet for db instances"
    }
}

resource "aws_subnet" "private_rds_subnet2" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_rds_subnet2_cidr}"
    availability_zone = "${var.availability_zone2}"

    tags {
        Name = "Private Subnet for db instances"
    }
}

resource "aws_subnet" "private_meta_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_meta_rds_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Private Subnet for meta dbs"
    }
}
