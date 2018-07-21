###
#
# ALB Target Group
#

# EC2
resource "aws_alb_target_group" "container-instance" {
  deregistration_delay = 10

  health_check {
    healthy_threshold   = 2
    interval            = 60
    matcher             = "302"
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 5
  }

  name     = "container-instance"
  port     = 89
  protocol = "HTTP"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.ecs.id}"
}

#Fargate 
resource "aws_alb_target_group" "fargate" {
  deregistration_delay = 10

  health_check {
    healthy_threshold   = 2
    interval            = 60
    matcher             = "302"
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 5
  }

  name     = "fargate"
  port     = 80
  protocol = "HTTP"

  target_type = "ip"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.ecs.id}"
}
