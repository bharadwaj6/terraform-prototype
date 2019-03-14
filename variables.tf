variable "access_name" {}
variable "access_key" {}
variable "region" {
  default = "ap-south-1"
}
variable "aws_key_path" {}
variable "aws_key_name" {}


# resource "aws_key_pair" "deployer" {
#   key_name   = "terraform-keys"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGbKKlx4Ef6OvLG2U0hy4t8fRwIyNUPS/YOqlBjU6cFu5MCk4H0Q2/rM+B4xAtZc5cbVONasZ2N04oNkFABSZ8J09Kgt9kNHX6JXXUJ1Y4a/sakRuseQ2M6oZrxPYTnKQC+kN0LFsQ7KGJpF2ExGX/SNe1iV6J9zUFOeaBAq9QhvwgxL7qQQtGUomKTPo0cGxqx7WyxOO8M2/fQ/bx6HbfOJKSrtIuBRhiWGRIXz87w6USm3wcLxTCCREC5vt3EoBVkcaAMzT0PdNyGXtVAN3D+M7FJoGKQsIoy4E9jusqpzr0FLu4e8eugumIQYRCJzkyD7mSF3FjqzKP0uZOfheH bharadwaj@bharadwaj-Inspiron-7570"
# }

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-0de53d8956e8dcf80"
    "us-west-2" = "ami-4b32be2b"
    "ap-south-1" = "ami-0889b8a448de4fc44"
  }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_ssh_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/18"
}

variable "public_http_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.64.0/18"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.128.0/17"
}
