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
    Environment = "staging"
  }
}

resource "aws_s3_bucket" "localstack" {
  bucket = "localstack"
}

resource "aws_instance" "localstack" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t4g.small"
  vpc_security_group_ids = [aws_security_group.localstack.id]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "localstack" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
