variable "org" {
  type        = string
  description = "Terraform Cloud Organization"
}

variable "doormat-workspace" {
  type        = string
  description = "Name of doormat deployment iam role workspace"
  default     = "doormat-deployment-iam-role"
}

variable "region" {
  type        = string
  description = "AWS Region in which to provision this VPC."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}
variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets for this VPC."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets for this VPC."
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "one_nat_gateway_per_az" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "prefix" {
  type        = string
  description = "Prefix for resources."
}