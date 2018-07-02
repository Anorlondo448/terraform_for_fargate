###
#
# Task Definition
#
resource "aws_ecs_task_definition" "service" {
  family                = "service"
  container_definitions = "${file("task_definitions/service.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}

data "template_file" "service" {
  template = "${file("task_definitions/service.json")}"

  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
  }
}
