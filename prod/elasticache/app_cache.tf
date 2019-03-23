resource "aws_elasticache_cluster" "app_cache" {
  cluster_id           = "app-cache"
  engine               = "redis"
  node_type            = "${var.node_type}"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.3"
  port                 = 6379
  subnet_group_name = "${var.subnet_group_name}"
}

