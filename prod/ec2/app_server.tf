resource "aws_instance" "app_server" {
    ami = "${var.app_server_amis["${var.region}"]}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.public_ssh_subnet_id}"
    source_dest_check = false
    security_groups = ["${var.app_citizen_sg_id}"]

    tags {
        Name = "App Server"
    }
}

resource "aws_instance" "async_server" {
    ami = "${var.app_server_amis["${var.region}"]}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.public_ssh_subnet_id}"
    source_dest_check = false
    security_groups = ["${var.app_citizen_sg_id}"]

    tags {
        Name = "Async Server"
    }
}
