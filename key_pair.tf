###
#
# Key Pair
#
resource "aws_key_pair" "fargate-demo" {
  key_name   = "fargate-demo"
  public_key = "${file("key/fargate-demo.pub")}"
}
