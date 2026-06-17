terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region"      { default = "us-east-1" }
variable "project_name"    { default = "lab06-pipeline" }
variable "ecr_repo_name"   { default = "lab04-fargate" }
variable "ecs_cluster_name" { default = "lab04-fargate-cluster" }
variable "ecs_service_name" { default = "lab04-fargate-service" }
variable "approval_email"  {
  description = "Email address for pipeline approval notifications"
  type        = string
  default     = "you@example.com"
}

data "aws_caller_identity" "current" {}

# -------------------------------------------------------
# S3 Artifact Bucket
# -------------------------------------------------------
resource "aws_s3_bucket" "artifacts" {
  bucket = "${var.project_name}-artifacts-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  versioning_configuration { status = "Enabled" }
}

# -------------------------------------------------------
# CodeBuild IAM Role
# -------------------------------------------------------
resource "aws_iam_role" "codebuild" {
  name = "${var.project_name}-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "codebuild.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_admin" {
  role       = aws_iam_role.codebuild.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess" # Tighten in production
}

# -------------------------------------------------------
# CodeBuild Project
# -------------------------------------------------------
resource "aws_codebuild_project" "build" {
  name          = "${var.project_name}-build"
  service_role  = aws_iam_role.codebuild.arn
  build_timeout = 10

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }

  artifacts { type = "CODEPIPELINE" }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true # Required for Docker builds
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "ECR_REPO_NAME"
      value = var.ecr_repo_name
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.account_id
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/codebuild/${var.project_name}"
      stream_name = "build"
    }
  }
}

# -------------------------------------------------------
# SNS Approval Topic
# -------------------------------------------------------
resource "aws_sns_topic" "approval" {
  name = "${var.project_name}-approval"
}

resource "aws_sns_topic_subscription" "approval_email" {
  topic_arn = aws_sns_topic.approval.arn
  protocol  = "email"
  endpoint  = var.approval_email
}

# -------------------------------------------------------
# CodePipeline IAM Role
# -------------------------------------------------------
resource "aws_iam_role" "pipeline" {
  name = "${var.project_name}-pipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "codepipeline.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "pipeline_admin" {
  role       = aws_iam_role.pipeline.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # Tighten in production
}

# -------------------------------------------------------
# CodePipeline
# -------------------------------------------------------
resource "aws_codepipeline" "main" {
  name     = var.project_name
  role_arn = aws_iam_role.pipeline.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.artifacts.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit" # Swap for "CodeStarSourceConnection" for GitHub
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName       = var.project_name
        BranchName           = "main"
        PollForSourceChanges = "false"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = aws_codebuild_project.build.name
      }
    }
  }

  stage {
    name = "Approve"
    action {
      name     = "ManualApproval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"

      configuration = {
        NotificationArn    = aws_sns_topic.approval.arn
        CustomData         = "Please review the build artifacts before deploying to production."
        ExternalEntityLink = "https://console.aws.amazon.com/codesuite/codepipeline"
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ClusterName = var.ecs_cluster_name
        ServiceName = var.ecs_service_name
        FileName    = "imagedefinitions.json"
      }
    }
  }
}

# -------------------------------------------------------
# Outputs
# -------------------------------------------------------
output "pipeline_name" {
  value = aws_codepipeline.main.name
}
