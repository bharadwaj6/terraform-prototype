module "consul" {
  source = "hashicorp/consul/aws"
  version = "0.3.3"

  aws_region = "ap-south-1"
  num_servers = "3"
}
