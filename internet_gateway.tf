###
#
# Internet Gateway
#
resource "aws_internet_gateway" "ecs" {
  vpc_id     = "${aws_vpc.ecs.id}"
  depends_on = ["aws_vpc.ecs"]

  tags {
    Name = "ecs"
  }
}
