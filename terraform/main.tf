resource "aws_lambda_function" "lambda_function" {
  filename = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256
  function_name = "getVisitorCount"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"
}

resource "aws_iam_role" "lambda_role" {
  name = "getVisitorCountRole"
  assume_role_policy = <<-EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "lambda.amazonaws.com"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        }
    EOF
}

resource "aws_iam_policy" "lambda_permissions" {
  name = "lambda_permissions"
  path = "/"
  description = "Grant Lambda function permissions"

policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogsStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:*:*",
          "Effect" : "Allow"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "dynamodb:UpdateItem",
            "dynamodb:GetItem"
          ],
          "Resource" : "arn:aws:dynamodb:*:*:table/site-views"
        }
      ]
    }
  )
}



resource "aws_iam_role_policy_attachment" "attach_policy" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_permissions.arn
}

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "site-views"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"

  attribute {
    name = "ID"
    type = "S"
  }
}

data "archive_file" "zip" {
  type = "zip"
  source_dir = "${path.module}/lambda"
  output_path = "${path.module}/getVisitorCount.zip"
}