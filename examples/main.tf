provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = "3.39.0"
  }
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

data "aws_caller_identity" "current" {}


module "ecr_test" {

  source = "../"

  providers = {
    aws = aws.virginia
  }

  create               = true
  name                 = "ecr-test"
  image_tag_mutability = "MUTABLE"
  create_life_policy   = false
  create_replication   = true
  replication_region   = "us-east-2"
  replication_account  = local.account_id
}