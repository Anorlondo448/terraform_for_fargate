###
#
# IAM Role
#
resource "aws_iam_role" "fargate-demo" {
  name = "fargate-demo"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "fargate-demo" {
  name       = "fargate-demo"
  roles      = ["${aws_iam_role.fargate-demo.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "fargate-demo" {
  name = "fargate-demo"
  role = "${aws_iam_role.fargate-demo.name}"
}

## for ECS service
data "aws_iam_policy_document" "fargate-demo-service" {
  statement {
    effect = "Allow"

    actions = [
      "ecs:*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "fargate-demo-service" {
  name   = "fargate-demo-service"
  policy = "${data.aws_iam_policy_document.fargate-demo-service.json}"
}

resource "aws_iam_role" "fargate-demo-service" {
  name = "fargate-demo-service"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "fargate-demo-service" {
  role       = "${aws_iam_role.fargate-demo-service.name}"
  policy_arn = "${aws_iam_policy.fargate-demo-service.arn}"
}
