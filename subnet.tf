###
#
# Subnet(public)
#
resource "aws_subnet" "public-1a" {
  vpc_id            = "${aws_vpc.fargate-demo.id}"
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "fargate-demo-public"
  }
}
