/*
  Public Subnet
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

resource "aws_route_table" "public_subnet_http" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet HTTP"
    }
}

resource "aws_route_table_association" "public_subnet_http" {
    subnet_id = "${aws_subnet.public_subnet_http.id}"
    route_table_id = "${aws_route_table.public_subnet_http.id}"
}

resource "aws_route_table_association" "public_subnet_ssh" {
    subnet_id = "${aws_subnet.public_subnet_ssh.id}"
    route_table_id = "${aws_route_table.public_subnet_ssh.id}"
}

/*
  Private Subnet
*/

resource "aws_route_table" "private_subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "private_subnet" {
    subnet_id = "${aws_subnet.private_subnet.id}"
    route_table_id = "${aws_route_table.private_subnet.id}"
}
