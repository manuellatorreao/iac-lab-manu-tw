variable "prefix" {
  type        = string
  description = "The prefix to be used for naming resources"
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "number_public_subnets" {
  default = 2
}

variable "number_private_subnets" {
  default =2
}

variable "number_secure_subnets" {
  default =2
}
