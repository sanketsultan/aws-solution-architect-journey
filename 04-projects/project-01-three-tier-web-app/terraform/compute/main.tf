terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  # Uncomment for remote state:
  # backend "s3" {
  #   bucket = "your-tfstate-bucket"
  #   key    = "project01/compute/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.aws_region
}

# -------------------------------------------------------
# Variables — fill in or reference remote state outputs
# -------------------------------------------------------
variable "aws_region"      { default = "us-east-1" }
variable "project_name"    { default = "project01" }
variable "vpc_id"          { description = "VPC ID from vpc layer" }
variable "public_subnets"  { description = "List of public subnet IDs" }
variable "private_subnets" { description = "List of private subnet IDs" }
variable "container_image" { description = "Full ECR image URI including tag" }

# -------------------------------------------------------
# TODO: Add the following resources
# -------------------------------------------------------
# - aws_ecs_cluster
# - aws_ecs_task_definition
# - aws_ecs_service
# - aws_lb (ALB)
# - aws_lb_target_group
# - aws_lb_listener (HTTP redirect + HTTPS)
# - aws_appautoscaling_target + aws_appautoscaling_policy
# - aws_security_group (ALB, Tasks)
# - aws_ecr_repository
