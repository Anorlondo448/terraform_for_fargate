###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform-for-fargate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
