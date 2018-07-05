###
#
# Service
#
resource "aws_ecs_service" "fargate-demo" {
  name            = "fargate-demo"
  cluster         = "${aws_ecs_cluster.fargate-demo.id}"
  task_definition = "${aws_ecs_task_definition.fargate-demo.arn}"
  desired_count   = 1
  launch_type     = "EC2"

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
