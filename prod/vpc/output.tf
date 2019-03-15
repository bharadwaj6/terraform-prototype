output "nat_instance_id" {
  value = "${aws_instance.nat.id}"
}
output "public_ssh_subnet_id" {
  value = "${aws_subnet.public_subnet_ssh.id}"
}
output "public_http_subnet_id" {
  value = "${aws_subnet.public_subnet_http.id}"
}
output "private_http_subnet_id" {
  value = "${aws_subnet.private_subnet.id}"
}
