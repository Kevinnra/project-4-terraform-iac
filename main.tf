terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "KR-CLI-IAM"
}

resource "aws_s3_bucket" "practice" {
  bucket = var.bucket_name

  tags = {
    Project     = "project-4-terraform-iac"
    Environment = "learning"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "practice" {
  bucket = aws_s3_bucket.practice.id

  versioning_configuration {
    status = "Enabled"
  }
}