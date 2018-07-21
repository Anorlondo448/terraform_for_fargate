###
#
# Task Definition for EC2
#
resource "aws_ecs_task_definition" "container-instance" {
  family                = "container-instance"
  container_definitions = "${file("task_definitions/container-instance.json")}"

  volume {
    name      = "container-instance-storage"
    host_path = "/ecs/container-instance-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}

data "template_file" "container-instance" {
  template = "${file("task_definitions/container-instance.json")}"

  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
  }
}

###
#
# Task Definition for Fargate
#
# resource "aws_ecs_task_definition" "fargate" {
#   family                = "fargate"
#   container_definitions = "${file("task_definitions/fargate.json")}"


#   execution_role_arn       = "${aws_iam_role.fargate.arn}"
#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   cpu                      = 256
#   memory                   = 512
# }


# data "template_file" "fargate" {
#   template = "${file("task_definitions/fargate.json")}"


#   vars {
#     aws_account_id = "${data.aws_caller_identity.current.account_id}"
#   }
# }

