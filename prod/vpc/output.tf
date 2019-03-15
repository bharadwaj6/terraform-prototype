output "nat_instance_id" {
  value = "${aws_instance.nat.id}"
}
output "public_ssh_subnet_id" {
  value = "${aws_subnet.public_subnet_ssh.id}"
}
output "public_http_app_subnet_id" {
  value = "${aws_subnet.public_subnet_http_app.id}"
}
output "public_http_meta_subnet_id" {
  value = "${aws_subnet.public_subnet_http_app.id}"
}

output "private_app_subnet_id" {
  value = "${aws_subnet.private_app_subnet.id}"
}
output "private_meta_subnet_id" {
  value = "${aws_subnet.private_meta_subnet.id}"
}
output "private_rds_subnet_id" {
  value = "${aws_subnet.private_rds_subnet.id}"
}

output "public_subnet_ssh_sg_id" {
  value = "${aws_security_group.public_subnet_ssh_sg.id}"
}

output "public_subnet_app_sg_id" {
  value = "${aws_security_group.public_subnet_http_app_sg.id}"
}

output "public_subnet_meta_sg_id" {
  value = "${aws_security_group.public_subnet_http_meta_sg.id}"
}
