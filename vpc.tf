provider "aws" {
  access_key = "${var.access_name}"
  secret_key = "${var.access_key}"
  region     = "ap-south-1"
}


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
  NAT Instance
*/
resource "aws_security_group" "nat" {
    name = "vpc_nat"
    description = "Allow traffic to pass from the private subnet to the internet"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "NATSG"
    }
}

resource "aws_instance" "nat" {
    ami = "ami-00b3aa8a93dd09c13" # this is a special ami preconfigured to do NAT
    availability_zone = "ap-south-1a"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.nat.id}"]
    subnet_id = "${aws_subnet.ap-south-1a-public_http.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }
}

resource "aws_eip" "nat" {
    instance = "${aws_instance.nat.id}"
    vpc = true
}

output "nat_instance_id" {
  value = "${aws_instance.nat.id}"
}


/*
  Public Subnet
*/
resource "aws_subnet" "ap-south-1a-public_http" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_http_subnet_cidr}"
    availability_zone = "ap-south-1a"

    tags {
        Name = "Public Subnet HTTP"
    }
}

resource "aws_subnet" "ap-south-1a-public_ssh" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_ssh_subnet_cidr}"
    availability_zone = "ap-south-1a"

    tags {
        Name = "Public Subnet SSH"
    }
}

output "public_ssh_subnet_id" {
  value = "${aws_subnet.ap-south-1a-public_ssh.id}"
}
output "public_http_subnet_id" {
  value = "${aws_subnet.ap-south-1a-public_http.id}"
}

resource "aws_route_table" "ap-south-1a-public_ssh" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet SSH"
    }
}

resource "aws_route_table" "ap-south-1a-public_http" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet HTTP"
    }
}

resource "aws_route_table_association" "ap-south-1a-public_http" {
    subnet_id = "${aws_subnet.ap-south-1a-public_http.id}"
    route_table_id = "${aws_route_table.ap-south-1a-public_http.id}"
}

resource "aws_route_table_association" "ap-south-1a-public_ssh" {
    subnet_id = "${aws_subnet.ap-south-1a-public_ssh.id}"
    route_table_id = "${aws_route_table.ap-south-1a-public_ssh.id}"
}

/*
  Private Subnet
*/
resource "aws_subnet" "ap-south-1a-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "ap-south-1a"

    tags {
        Name = "Private Subnet"
    }
}
output "private_http_subnet_id" {
  value = "${aws_subnet.ap-south-1a-private.id}"
}
resource "aws_route_table" "ap-south-1a-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "ap-south-1a-private" {
    subnet_id = "${aws_subnet.ap-south-1a-private.id}"
    route_table_id = "${aws_route_table.ap-south-1a-private.id}"
}
