variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "eks-project"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}