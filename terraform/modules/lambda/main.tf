resource "aws_lambda_function" "incident_responder" {
  function_name = "infragpt-incident-responder"

  filename         = "../../lambda/function.zip"
  source_code_hash = filebase64sha256("../../lambda/function.zip")

  handler = "incident_responder.lambda_handler"
  runtime = "python3.10"

  role = var.lambda_role_arn
}

module "lambda" {
  source = "./modules/lambda"

  lambda_role_arn = module.iam.lambda_role_arn
}