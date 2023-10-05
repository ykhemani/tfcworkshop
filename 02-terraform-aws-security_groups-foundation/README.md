# terraform-aws-security_groups

Creates foundational security groups.

## Required Inputs

* `tag_owner` - specifies the value for the `owner` tag used in tagging all resources generated with this Terraform configuration, as well as for naming the VPC created by this configuration.

* `owner_cidr_blocks` - list specifying the CIDR blocks of the owner's networks.
