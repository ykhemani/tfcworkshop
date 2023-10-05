# terraform-aws-vpc

This Terraform configuration uses the [AWS VPC Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) to provision a VPC in [AWS](https://aws.amazon.com/).

## Use

Set the following Terraform variables in your workspace:

* `default_tags`

For example:
```
default_tags = {
  ttl           = 24
  tfe-workspace = "acme/terraform-aws-vpc"
  repo          = "ykhemani/terraform-aws-vpc"
}
```

* `owner`

For example:
```
owner = "yash"
```

Also set AWS credentials as environment variables, either in your workspace or in the environment where your Terraform Agent will execute the Terraform run.

For example:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

---
