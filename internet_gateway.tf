###
#
# Internet Gateway
#
resource "aws_internet_gateway" "fargate-demo" {
  vpc_id     = "${aws_vpc.fargate-demo.id}"
  depends_on = ["aws_vpc.fargate-demo"]

  tags {
    Name = "fargate-demo"
  }
}
