resource "aws_instance" "bastion" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    subnet_id = "${module.vpc.public_ssh_subnet_id}"
    source_dest_check = false
    security_groups = ["${module.vpc.aws_security_group.public_subnet_ssh_sg.id}"]

    tags {
        Name = "Bastion Server"
    }
}

resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}
