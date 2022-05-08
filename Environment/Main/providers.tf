terraform {
  required_providers {
    aws = {
    source = "hashicorp/aws"
    #  Allow any 3.22+  version of the AWS provider
    version = "4.12.1"
    }
    null = {
    source = "hashicorp/null"
    version = "~> 3.0"
    }
    external = {
    source = "hashicorp/external"
    version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket          = "********" //S3 Bucket Name
    key             = "tf/terraform.tfstate"
    region          = "ap-southeast-3"
    encrypt         = "true"
    dynamodb_table  = "********" //DynamoDB Table Name    
  }
}
