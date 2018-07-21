###
#
# ALB Listener
#
resource "aws_alb_listener" "ecs" {
  load_balancer_arn = "${aws_alb.ecs.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.container-instance.id}"
    type             = "forward"
  }
}
