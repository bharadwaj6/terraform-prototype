resource "aws_launch_configuration" "app-launch-config" {
  image_id = "${var.app_server_amis["${var.region}"]}"
  instance_type = "${var.instance_type}"
  security_groups = ["${var.web_citizen_sg_id}"]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app-autoscaling-group" {
  launch_configuration = "${aws_launch_configuration.app-launch-config.id}"
  min_size = 1
  max_size = 2
  load_balancers = ["${aws_elb.app-elb.name}"]
  health_check_type = "ELB"
  vpc_zone_identifier = ["${var.public_http_app_subnet_id}"]

  tag {
    key = "App Autoscaling group"
    value = "app-elb"
    propagate_at_launch = true
  }
}

resource "aws_elb" "app-elb" {
  name = "app-elb"
  security_groups = ["${var.web_citizen_sg_id}"]
  subnets = ["${var.public_http_app_subnet_id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

# Enable with certificate when running in real config
#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

}