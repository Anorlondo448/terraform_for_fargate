###
#
# ECS Cluster
#
resource "aws_ecs_cluster" "fargate-demo" {
  name = "fargate-demo"
}
