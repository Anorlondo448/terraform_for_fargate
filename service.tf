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
}

###
#
# Service for Fargate
#
resource "aws_ecs_service" "fargate" {
  name            = "fargate"
  cluster         = "${aws_ecs_cluster.fargate-demo.id}"
  task_definition = "${aws_ecs_task_definition.fargate.arn}"
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration = {
    subnets = [
      "${aws_subnet.public-1a.id}",
      "${aws_subnet.public-1c.id}",
    ]

    assign_public_ip = true
  }
}
