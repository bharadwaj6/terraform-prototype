/*
  Public Subnets
*/

resource "aws_route_table" "public_subnet_ssh" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet SSH"
    }
}

resource "aws_route_table" "public_subnet_http_app" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet HTTP for app elbs."
    }
}

resource "aws_route_table" "public_subnet_http_meta" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet HTTP for meta servers"
    }
}

resource "aws_route_table_association" "public_subnet_http_app" {
    subnet_id = "${aws_subnet.public_subnet_http_app.id}"
    route_table_id = "${aws_route_table.public_subnet_http_app.id}"
}

resource "aws_route_table_association" "public_subnet_http_meta" {
    subnet_id = "${aws_subnet.public_subnet_http_meta.id}"
    route_table_id = "${aws_route_table.public_subnet_http_meta.id}"
}

resource "aws_route_table_association" "public_subnet_ssh" {
    subnet_id = "${aws_subnet.public_subnet_ssh.id}"
    route_table_id = "${aws_route_table.public_subnet_ssh.id}"
}

/*
  Private Subnets
*/

resource "aws_route_table" "private_meta_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet for meta dbs"
    }
}

resource "aws_route_table" "private_app_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet for app servers"
    }
}

resource "aws_route_table" "private_rds_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet for app dbs"
    }
}

resource "aws_route_table_association" "private_rds_subnet" {
    subnet_id = "${aws_subnet.private_rds_subnet.id}"
    route_table_id = "${aws_route_table.private_rds_subnet.id}"
}

resource "aws_route_table_association" "private_app_subnet" {
    subnet_id = "${aws_subnet.private_app_subnet.id}"
    route_table_id = "${aws_route_table.private_app_subnet.id}"
}
resource "aws_route_table_association" "private_meta_subnet" {
    subnet_id = "${aws_subnet.private_meta_subnet.id}"
    route_table_id = "${aws_route_table.private_meta_subnet.id}"
}
