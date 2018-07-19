###
#
# Route Table
#
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.ecs.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ecs.id}"
  }

  tags {
    Name = "ecs-main"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.ecs.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = "${aws_subnet.public-1a.id}"
  route_table_id = "${aws_route_table.main.id}"
}
