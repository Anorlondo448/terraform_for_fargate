###
#
# Task Definition
#
resource "aws_ecs_task_definition" "fargate-demo" {
  family                = "fargate-demo"
  container_definitions = "${file("task_definitions/fargate-demo.json")}"

  # volume {
  #   name      = "fargate-demo-storage"
  #   host_path = "/ecs/fargate-demo-storage"
  # }

  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  # }
  execution_role_arn = "${aws_iam_role.fargate-demo-fargate.arn}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 512
}

data "template_file" "fargate-demo" {
  template = "${file("task_definitions/fargate-demo.json")}"

  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
  }
}
