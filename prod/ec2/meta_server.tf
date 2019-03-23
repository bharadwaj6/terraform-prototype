resource "aws_instance" "meta_server" {
    ami = "${var.meta_server_amis["${var.region}"]}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.public_http_meta_subnet_id}"
    source_dest_check = false
    security_groups = ["${var.meta_citizen_sg_id}"]

    tags {
        Name = "Meta Server"
    }
}

