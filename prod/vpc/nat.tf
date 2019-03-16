resource "aws_instance" "nat" {
    ami = "${var.nat_amis["${var.region}"]}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${aws_security_group.nat.id}"]
    subnet_id = "${aws_subnet.public_subnet_http_app.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }
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
        cidr_blocks = ["${var.private_app_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.private_app_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
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
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "krypton_NAT"
    }
}
