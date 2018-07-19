###
#
# Security Group
#

resource "aws_security_group" "container-instance" {
  vpc_id      = "${aws_vpc.ecs.id}"
  name        = "container-instance"
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
    Name = "container-instance"
  }
}
