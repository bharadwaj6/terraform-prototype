output "nat_instance_id" {
  value = "${aws_instance.nat.id}"
}
output "public_ssh_subnet_id" {
  value = "${aws_subnet.ap-south-1a-public_ssh.id}"
}
output "public_http_subnet_id" {
  value = "${aws_subnet.ap-south-1a-public_http.id}"
}
output "private_http_subnet_id" {
  value = "${aws_subnet.ap-south-1a-private.id}"
}
