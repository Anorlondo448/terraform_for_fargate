###
#
# Common
#
## 対象となるプロバイダ(AWS,GCP,etc)を指定します
provider "aws" {
  region = "us-east-1"
}

# 動的にアカウントIDを取ってくる
data "aws_caller_identity" "current" {}

# 動的にリージョンを取ってくる
data "aws_region" "current" {}
