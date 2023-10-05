provider "aws" {
  region = var.region
}

################################################################################
# workspace: aws-foundation
resource "aws_iam_role" "aws-foundation" {
  name = "${var.org}-${var.foundation_workspace}-role"
  tags = {
    hc-service-uri = "${var.tfe_addr}/${var.org}/${var.foundation_workspace}"
  }
  max_session_duration = 43200
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy_document.json
  inline_policy {
    name   = "SampleRolePermissions"
    policy = data.aws_iam_policy_document.demo.json
  }
}

output "aws_iam_role_aws-foundation_arn" {
  value = aws_iam_role.aws-foundation.arn
}

################################################################################
# workspace: aws-foundation-security-groups
resource "aws_iam_role" "aws-foundation-security-groups" {
  name = "${var.org}-${var.sg_workspace}-role"
  tags = {
    hc-service-uri = "${var.tfe_addr}/${var.org}/${var.sg_workspace}"
  }
  max_session_duration = 43200
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy_document.json
  inline_policy {
    name   = "SampleRolePermissions"
    policy = data.aws_iam_policy_document.demo.json
  }
}

output "aws_iam_role_aws-foundation-security-groups_arn" {
  value = aws_iam_role.aws-foundation-security-groups.arn
}

################################################################################
# workspace: aws-ssh-keys
resource "aws_iam_role" "aws-ssh-keys" {
  name = "${var.org}-${var.ssh-keys-workspace}-role"
  tags = {
    hc-service-uri = "${var.tfe_addr}/${var.org}/${var.ssh-keys-workspace}"
  }
  max_session_duration = 43200
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy_document.json
  inline_policy {
    name   = "SampleRolePermissions"
    policy = data.aws_iam_policy_document.demo.json
  }
}

output "aws_iam_role_aws-ssh-keys_arn" {
  value = aws_iam_role.aws-vm.arn
}

################################################################################
# workspace: aws-vm
resource "aws_iam_role" "aws-vm" {
  name = "${var.org}-${var.app-workspace}-role"
  tags = {
    hc-service-uri = "${var.tfe_addr}/${var.org}/${var.app-workspace}"
  }
  max_session_duration = 43200
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy_document.json
  inline_policy {
    name   = "SampleRolePermissions"
    policy = data.aws_iam_policy_document.demo.json
  }
}

output "aws_iam_role_aws-vm_arn" {
  value = aws_iam_role.aws-vm.arn
}

################################################################################
# iam policies

data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:SetSourceIdentity",
      "sts:TagSession"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::397512762488:user/doormatServiceUser"] # infrasec_prod   
    }
  }
}

# Adjust actions as appropriate per resources that need to be provisioned.
data "aws_iam_policy_document" "demo" {
  statement {
    actions = [
      "ec2:*",
      "ecs:*",
      "eks:*",
      "rds:*",
      "s3:*",
      "kms:*",
      "logs:*",
      "iam:*"
    ]
    resources = ["*"]
  }
}
