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

variable "name" {
  type        = string
  description = "Name of the vpc"
}

variable "public_subnets" {
  type = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnets" {
  type = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "secure_subnets" {
  type = list(string)
  description = "List of secure subnet CIDR blocks"
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

variable "single_nat_gateway" {
  description = "Flag to indicate whether to create a single NAT Gateway"
  type        = bool
  default     = true
}
