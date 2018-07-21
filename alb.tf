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
