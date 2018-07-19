###
#
# Subnet(public)
#
resource "aws_subnet" "public-1a" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "ecs-public-1a"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.2.0/24"
  availability_zone = "us-east-1c"

  tags {
    Name = "ecs-public-1c"
  }
}
