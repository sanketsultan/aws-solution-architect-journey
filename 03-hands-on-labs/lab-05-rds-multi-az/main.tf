terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region"   { default = "us-east-1" }
variable "project_name" { default = "lab05-rds" }
variable "db_password"  {
  description = "Master DB password — supply via TF_VAR_db_password or tfvars"
  type        = string
  sensitive   = true
}

# Use the default VPC for simplicity — swap with Lab 01 VPC for production
data "aws_vpc" "default"     { default = true }
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# -------------------------------------------------------
# Security Group
# -------------------------------------------------------
resource "aws_security_group" "rds" {
  name   = "${var.project_name}-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "MySQL from within VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.default.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------------------------------------
# DB Subnet Group
# -------------------------------------------------------
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-subnet-group"
  subnet_ids = data.aws_subnets.default.ids

  tags = { Name = "${var.project_name}-subnet-group" }
}

# -------------------------------------------------------
# RDS Parameter Group
# -------------------------------------------------------
resource "aws_db_parameter_group" "main" {
  name   = "${var.project_name}-pg"
  family = "mysql8.0"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }
  parameter {
    name  = "long_query_time"
    value = "2"
  }
}

# -------------------------------------------------------
# RDS Instance — Multi-AZ
# -------------------------------------------------------
resource "aws_db_instance" "main" {
  identifier             = "${var.project_name}-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  max_allocated_storage  = 100
  storage_type           = "gp3"
  storage_encrypted      = true

  db_name  = "appdb"
  username = "admin"
  password = var.db_password

  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.main.name

  backup_retention_period = 7
  backup_window           = "02:00-03:00"
  maintenance_window      = "Mon:03:00-Mon:04:00"

  deletion_protection = false # Set to true for production
  skip_final_snapshot = false
  final_snapshot_identifier = "${var.project_name}-final-snapshot"

  tags = { Name = "${var.project_name}-db" }
}

# -------------------------------------------------------
# Read Replica
# -------------------------------------------------------
resource "aws_db_instance" "replica" {
  identifier          = "${var.project_name}-replica"
  replicate_source_db = aws_db_instance.main.identifier
  instance_class      = "db.t3.micro"
  storage_encrypted   = true
  skip_final_snapshot = true

  tags = { Name = "${var.project_name}-replica" }
}

# -------------------------------------------------------
# Outputs
# -------------------------------------------------------
output "primary_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "replica_endpoint" {
  value = aws_db_instance.replica.endpoint
}
