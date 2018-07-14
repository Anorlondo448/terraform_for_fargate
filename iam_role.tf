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

## for ECS fargate
data "aws_iam_policy_document" "fargate-demo-fargate" {
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

resource "aws_iam_policy" "fargate-demo-fargate" {
  name   = "fargate-demo-fargate"
  policy = "${data.aws_iam_policy_document.fargate-demo-fargate.json}"
}

resource "aws_iam_role" "fargate-demo-fargate" {
  name = "fargate-demo-fargate"

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

resource "aws_iam_role_policy_attachment" "fargate-demo-fargate" {
  role       = "${aws_iam_role.fargate-demo-fargate.name}"
  policy_arn = "${aws_iam_policy.fargate-demo-fargate.arn}"
}
