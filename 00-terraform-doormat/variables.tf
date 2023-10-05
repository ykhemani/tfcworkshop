variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "tfe_addr" {
  type        = string
  description = "Terraform Cloud|Enterprise address"
  default     = "app.terraform.io"
}
variable "org" {
  type        = string
  description = "Terraform Cloud Organization"
}

variable "foundation_workspace" {
  type        = string
  description = "Name of AWS Foundation workspace"
  default     = "aws-foundation"
}

variable "sg_workspace" {
  type        = string
  description = "Name of AWS Foundational Security Groups workspace"
  default     = "aws-foundation-security-groups"
}

variable "ssh-keys-workspace" {
  type        = string
  description = "Name of workspace with ssh keys"
  default     = "aws-ssh-keys"
}

variable "app-workspace" {
  type        = string
  description = "Name of app workspace"
  default     = "aws-vm"
}
