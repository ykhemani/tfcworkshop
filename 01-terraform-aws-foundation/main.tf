locals {
  tags = merge(
    var.global_tags,
    var.local_tags
  )
}

data "terraform_remote_state" "doormat-deployment-iam-role" {
  backend = "remote"

  config = {
    organization = var.org
    workspaces = {
      name = var.doormat-workspace
    }
  }
}

data "doormat_aws_credentials" "creds" {
  provider = doormat
  role_arn = data.terraform_remote_state.doormat-deployment-iam-role.outputs.aws_iam_role_aws-foundation_arn
}

provider "aws" {
  access_key = data.doormat_aws_credentials.creds.access_key
  secret_key = data.doormat_aws_credentials.creds.secret_key
  token      = data.doormat_aws_credentials.creds.token
  region     = var.region
  default_tags {
    tags = local.tags
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr

  azs                    = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames   = var.enable_dns_hostnames
}
