terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source = "./modules/lambda"

  lambda_role_arn = module.iam.lambda_role_arn
}

module "dynamodb" {
  source = "./modules/dynamodb"
}