# resource "aws_instance" "bastion" {
#     ami = "${var.bastion_amis["${var.region}"]}"
#     availability_zone = "${var.availability_zone}"
#     instance_type = "${var.instance_type}"
#     subnet_id = "${var.public_ssh_subnet_id}"
#     source_dest_check = false
#     security_groups = ["${var.public_subnet_ssh_sg_id}"]

#     tags {
#         Name = "Bastion Server"
#     }
# }

# resource "aws_eip" "bastion" {
#   instance = "${aws_instance.bastion.id}"
#   vpc      = true
# }
