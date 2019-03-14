/*
  Public Subnet
*/

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
