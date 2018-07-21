###
#
# Service for EC2
#
resource "aws_ecs_service" "container-instance" {
  name            = "container-instance"
  cluster         = "${aws_ecs_cluster.fargate-demo.id}"
  task_definition = "${aws_ecs_task_definition.container-instance.arn}"
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.container-instance.arn}"
    container_name   = "httpd"
    container_port   = "80"
  }

  depends_on = [
    "aws_alb_listener.container-instance",
  ]
}

###
#
# Service for Fargate
#
# resource "aws_ecs_service" "fargate" {
#   name            = "fargate"
#   cluster         = "${aws_ecs_cluster.fargate-demo.id}"
#   task_definition = "${aws_ecs_task_definition.fargate.arn}"
#   desired_count   = 1
#   launch_type     = "FARGATE"


#   load_balancer {
#     container_name   = "httpd"
#     container_port   = "80"
#     target_group_arn = "${aws_alb_target_group.fargate.arn}"
#   }


#   network_configuration = {
#     subnets = [
#       "${aws_subnet.public-1a.id}",
#       "${aws_subnet.public-1c.id}",
#     ]


#     assign_public_ip = true
#   }
# }

