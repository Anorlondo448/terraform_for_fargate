###
#
# IAM Role
#
resource "aws_iam_role" "container-instance" {
  name = "container-instance"

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

resource "aws_iam_policy_attachment" "container-instance" {
  name       = "container-instance"
  roles      = ["${aws_iam_role.container-instance.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "container-instance" {
  name = "container-instance"
  role = "${aws_iam_role.container-instance.name}"
}

## for ECS fargate
data "aws_iam_policy_document" "fargate" {
  statement {
    effect = "Allow"

    actions = [
      "ecs:*",
      "cloudwatch:*",
      "logs:*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "fargate" {
  name   = "fargate"
  policy = "${data.aws_iam_policy_document.fargate.json}"
}

resource "aws_iam_role" "fargate" {
  name = "fargate"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "fargate" {
  role       = "${aws_iam_role.fargate.name}"
  policy_arn = "${aws_iam_policy.fargate.arn}"
}
