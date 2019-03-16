resource "aws_security_group" "private_subnet_app_sg" {
    name = "private_subnet_app_sg"
    description = "Allow incoming server connections."

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_app_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    egress { // for outgoing integrations
        from_port = 443
        to_port = 443
        protocol   = "tcp"
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol   = "tcp"
        cidr_blocks = ["${var.private_rds_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Private subnet App servers SG"
    }
}


resource "aws_security_group" "private_subnet_rds_sg" {
    name = "private_subnet_rds_sg"
    description = "Allow incoming database connections."

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["${var.private_app_subnet_cidr}"]
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Private subnet db SG"
    }
}


resource "aws_security_group" "private_subnet_meta_sg" {
    name = "private_subnet_meta_sg"
    description = "Allow incoming meta server connections."

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["${var.public_http_meta_subnet_cidr}"]
        security_groups = ["${aws_security_group.metacitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Private subnet meta db SG"
    }
}


resource "aws_security_group" "public_subnet_http_app_sg" {
    name = "public_subnet_http_app_sg"
    description = "Allow incoming web connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.private_app_subnet_cidr}"]
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Public subnet HTTP app SG"
    }
}

resource "aws_security_group" "public_subnet_http_meta_sg" {
    name = "public_subnet_http_meta_sg"
    description = "Allow incoming meta connections."

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${aws_security_group.metacitizen.id}"]
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
        cidr_blocks = ["${var.private_meta_rds_subnet_cidr}"]
        security_groups = ["${aws_security_group.metacitizen.id}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Public subnet HTTP meta SG"
    }
}

resource "aws_security_group" "public_subnet_ssh_sg" {
    name = "public_subnet_ssh_sg"
    description = "Allow incoming SSH/ Bastion connections."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = ["${aws_security_group.vettedcitizen.id}"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
        security_groups = ["${aws_security_group.vettedcitizen.id}"]
    }

    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Public subnet SSH / Bastion SG"
    }

}
