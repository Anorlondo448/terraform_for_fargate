###
#
# Common
#
## 対象となるプロバイダ(AWS,GCP,etc)を指定します
provider "aws" {
  region = "us-east-1"
}

variable "region" {
  type    = "string"
  default = "ap-northeast-1"
}
