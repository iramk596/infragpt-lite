resource "aws_lambda_function" "incident_responder" {
  function_name = "infragpt-incident-responder"

  filename         = "${path.root}/../lambda/function.zip"
  source_code_hash = filebase64sha256("${path.root}/../lambda/function.zip")

  handler = "incident_responder.lambda_handler"
  runtime = "python3.10"

  role = var.lambda_role_arn
}