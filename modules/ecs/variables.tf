variable "prefix" {
  type = string
  description = "Prefix to be used for naming resources"
}

variable "region" {
  type = string
  description = "AWS region"
}

variable "vpc_id" {
  description = "ID of the VPC where ECS will be deployed"
}

variable "private_subnet_ids" {
  description = "List of IDs of private subnets where ECS will be deployed"
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
}

variable "alb_security_group_id" {
  description = "ID of the security group associated with the ALB"
}
