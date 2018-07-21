###
#
# ALB Listener Rule
#
# EC2
resource "aws_lb_listener_rule" "container-instance" {
  listener_arn = "${aws_alb_listener.ecs.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.container-instance.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/"]
  }
}

# Fargate
resource "aws_lb_listener_rule" "fargate" {
  listener_arn = "${aws_alb_listener.ecs.arn}"
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.fargate.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/"]
  }
}
