resource "aws_network_acl" "private_subnet_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.private_subnet.id}"]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.public_http_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "${var.public_ssh_subnet_cidr}"
    from_port = 22
    to_port = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  tags = {
    Name = "private_subnet_acl"
  }
}

resource "aws_network_acl" "public_subnet_ssh_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.public_subnet_http.id}"]

  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "${var.public_ssh_subnet_cidr}"
    from_port = 22
    to_port = 22
  }

  tags = {
    Name = "public_subnet_ssh_acl"
  }
}

resource "aws_network_acl" "public_subnet_http_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.public_subnet_http.id}"]

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "${var.private_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  tags = {
    Name = "public_subnet_http_acl"
  }
}
