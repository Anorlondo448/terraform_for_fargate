###
#
# EC2(Container Instance)
#
resource "aws_instance" "container-instance" {
  count                       = 1
  instance_type               = "t2.micro"
  ami                         = "ami-5253c32d"
  subnet_id                   = "${aws_subnet.public-1a.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.container-instance.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.container-instance.name}"
  key_name                    = "${aws_key_pair.container-instance.key_name}"

  tags = {
    Name = "container-instance"
  }

  user_data = "${file("user_data/user_data.sh")}"
}
