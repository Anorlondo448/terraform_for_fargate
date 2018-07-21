###
#
# ALB
#
resource "aws_alb" "ecs" {
  name = "ecs"

  subnets = [
    "${aws_subnet.public-1a.id}",
    "${aws_subnet.public-1c.id}",
  ]

  security_groups = [
    "${aws_security_group.alb.id}",
  ]
}

# EC2
resource "aws_alb_listener" "container-instance" {
  load_balancer_arn = "${aws_alb.ecs.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.container-instance.id}"
    type             = "forward"
  }
}

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
  port     = 80
  protocol = "HTTP"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.ecs.id}"
}

# Fargate
# resource "aws_alb_listener" "fargate" {
#   load_balancer_arn = "${aws_alb.ecs.arn}"
#   port              = "80"
#   protocol          = "HTTP"


#   default_action {
#     target_group_arn = "${aws_alb_target_group.fargate.id}"
#     type             = "forward"
#   }
# }


# resource "aws_alb_target_group" "fargate" {
#   deregistration_delay = 10


#   health_check {
#     healthy_threshold   = 2
#     interval            = 60
#     matcher             = "302"
#     path                = "/"
#     timeout             = 10
#     unhealthy_threshold = 5
#   }


#   name     = "fargate"
#   port     = 80
#   protocol = "HTTP"


#   target_type = "ip"


#   stickiness {
#     type = "lb_cookie"
#   }


#   vpc_id = "${aws_vpc.ecs.id}"
# }

