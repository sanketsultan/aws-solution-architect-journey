terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region"       { default = "us-east-1" }
variable "project_name"     { default = "project01" }
variable "alarm_email"      { description = "Email for CloudWatch alarm notifications" }
variable "ecs_cluster_name" { description = "ECS cluster name for metrics" }

# -------------------------------------------------------
# TODO: Add the following resources
# -------------------------------------------------------
# - aws_sns_topic + aws_sns_topic_subscription (alarm notifications)
# - aws_cloudwatch_metric_alarm (ALB 5xx rate, ECS CPU, RDS FreeStorageSpace, DLQ depth)
# - aws_cloudwatch_dashboard (summary dashboard for the project)
# - aws_cloudwatch_log_metric_filter (extract error counts from app logs)
