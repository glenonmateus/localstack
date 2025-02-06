provider "aws" {
  region                      = "sa-east-1"
  access_key                  = "teste"
  secret_key                  = "teste"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

terraform {
  required_version = ">= 1.10.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_dynamodb_table" "localstack" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"
  attribute {
    name = "UserId"
    type = "S"
  }
  attribute {
    name = "GameTitle"
    type = "S"
  }
  attribute {
    name = "TopScore"
    type = "N"
  }
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
  global_secondary_index {
    name               = "GamteTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }
  tags = {
    Name        = "localstack"
    Environment = "production"
  }
}

resource "aws_s3_bucket" "localstack" {
  bucket = "localstack"
}

resource "aws_instance" "localstack" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t4g.small"
  tags = {
    Name = "HelloWorld"
  }
}
