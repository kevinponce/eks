resource "aws_elb" "eks_elb" {
  name                        = "${var.project_name}-elb"
  cross_zone_load_balancing   = "false"

  subnets=[
    aws_subnet.public-region-a.id,
    aws_subnet.public-region-b.id
  ]

  health_check {
    healthy_threshold   = "2"
    interval            = "10"
    target              = "TCP:30200"
    timeout             = "5"
    unhealthy_threshold = "6"
  }

  idle_timeout = "60"
  internal     = "false"

  listener {
    instance_port     = "30200"
    instance_protocol = "tcp"
    lb_port           = "80"
    lb_protocol       = "tcp"
  }
}
