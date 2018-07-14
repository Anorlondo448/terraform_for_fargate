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
}
