resource "aws_security_group" "private_subnet_sg" {
    name = "private_subnet_sg"
    description = "Allow incoming database and server connections."

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_subnet_cidr}"]
        security_groups = ["${aws_security_group.dbcitizen.id}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_subnet_cidr}"]
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }

    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_subnet_cidr}"]
        security_groups = ["${aws_security_group.vettedcitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = ["${aws_security_group.dbcitizen.id}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Private subnet Security Group"
    }
}


resource "aws_security_group" "public_subnet_http_sg" {
    name = "public_subnet_http_sg"
    description = "Allow incoming web connections."

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Public subnet HTTP Security Group"
    }
}

resource "aws_security_group" "public_subnet_ssh_sg" {
    name = "public_subnet_ssh_sg"
    description = "Allow incoming SSH/ Bastion connections."

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Public subnet SSH / Bastion Security Group"
    }

}
