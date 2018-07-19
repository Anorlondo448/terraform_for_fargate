###
#
# CloudWatch
#
## Logs
resource "aws_cloudwatch_log_group" "container-instance" {
  name = "container-instance"

  tags {
    Environment = "staging"
    Application = "container-instance"
  }
}

resource "aws_cloudwatch_log_group" "fargate" {
  name = "fargate"

  tags {
    Environment = "staging"
    Application = "fargate"
  }
}
