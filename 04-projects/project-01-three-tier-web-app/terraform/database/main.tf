terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region"      { default = "us-east-1" }
variable "project_name"    { default = "project01" }
variable "vpc_id"          { description = "VPC ID" }
variable "private_subnets" { description = "List of private subnet IDs for DB subnet group" }

# -------------------------------------------------------
# TODO: Add the following resources
# -------------------------------------------------------
# - aws_db_subnet_group
# - aws_rds_cluster (Aurora MySQL)
# - aws_rds_cluster_instance (writer + reader)
# - aws_elasticache_subnet_group
# - aws_elasticache_replication_group (Redis)
# - aws_secretsmanager_secret + aws_secretsmanager_secret_version (DB password)
# - aws_security_group (Aurora, Redis)
