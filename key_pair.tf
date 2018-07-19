###
#
# Key Pair
#
resource "aws_key_pair" "container-instance" {
  key_name   = "container-instance"
  public_key = "${file("key/container-instance.pub")}"
}
