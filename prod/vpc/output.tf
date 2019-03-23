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

output "vetted_citizen_sg_id" {
  value = "${aws_security_group.vettedcitizen.id}"
}

output "app_citizen_sg_id" {
  value = "${aws_security_group.appcitizen.id}"
}

output "meta_citizen_sg_id" {
  value = "${aws_security_group.metacitizen.id}"
}

output "web_citizen_sg_id" {
  value = "${aws_security_group.webcitizen.id}"
}

output "cache_subnet_group_name" {
  value = "${aws_elasticache_subnet_group.private_app_subnet.name}"
}
