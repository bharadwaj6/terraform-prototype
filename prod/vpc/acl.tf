// https://docs.aws.amazon.com/vpc/latest/userguide/vpc-recommended-nacl-rules.html#nacl-rules-scenario-2

//Private subnets

resource "aws_network_acl" "private_subnet_rds_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.private_rds_subnet.id}"]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.public_http_app_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  tags = {
    Name = "private_subnet_rds_acl"
  }
}

resource "aws_network_acl" "private_subnet_meta_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.private_meta_subnet.id}"]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.public_http_meta_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  tags = {
    Name = "private_subnet_meta_acl"
  }
}

resource "aws_network_acl" "private_subnet_app_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.private_app_subnet.id}"]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.public_http_app_subnet_cidr}"
    from_port = 443
    to_port = 443
  }

  egress { // for integrations
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "${var.private_app_subnet_cidr}"
    from_port = 443
    to_port = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.private_rds_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  tags = {
    Name = "private_subnet_app_acl"
  }
}

// Public subnets

resource "aws_network_acl" "public_subnet_ssh_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.public_subnet_ssh.id}"]

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
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  tags = {
    Name = "public_subnet_ssh_acl"
  }
}

resource "aws_network_acl" "public_subnet_http_app_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.public_subnet_http_app.id}"]

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "${var.private_app_subnet_cidr}"
    from_port = 443
    to_port = 443
  }

  tags = {
    Name = "public_subnet_http_app_acl"
  }
}

resource "aws_network_acl" "public_subnet_http_meta_acl" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.public_subnet_http_meta.id}"]

  ingress {
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
    cidr_block = "${var.private_meta_rds_subnet_cidr}"
    from_port = 5432
    to_port = 5432
  }

  tags = {
    Name = "public_subnet_http_meta_acl"
  }
}
