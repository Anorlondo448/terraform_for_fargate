###
#
# Security Group
#

resource "aws_security_group" "fargate-demo" {
  vpc_id      = "${aws_vpc.fargate-demo.id}"
  name        = "fargate-demo"
  description = "container instance security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "fargate-demo"
  }
}
