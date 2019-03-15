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
  Public Subnet
*/
resource "aws_subnet" "public_subnet_http" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_http_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public Subnet HTTP"
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
  Private Subnet
*/
resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Private Subnet"
    }
}
