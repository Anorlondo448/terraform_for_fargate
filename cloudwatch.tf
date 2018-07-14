###
#
# CloudWatch
#
## Logs
resource "aws_cloudwatch_log_group" "fargate-demo" {
  name = "fargate-demo"

  tags {
    Environment = "staging"
    Application = "fargate-demo"
  }
}
