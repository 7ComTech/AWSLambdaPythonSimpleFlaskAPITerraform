#################################### BASE RESOURCES #######################################
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.vpc_dns_support
  enable_dns_hostnames = var.vpc_dns_hostnames
  tags = {
    Name = "${var.project_name}VPC"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}Internet Gateway"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1_cidr
  map_public_ip_on_launch = var.public_subnets_map_public_ip_on_launch
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.project_name}PublicSubnet(AZ1)"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_2_cidr
  map_public_ip_on_launch = var.public_subnets_map_public_ip_on_launch
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.project_name}PublicSubnet(AZ2)"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_1_cidr
  map_public_ip_on_launch = var.private_subnets_map_public_ip_on_launch
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.project_name}PrivateSubnet(AZ1)"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_2_cidr
  map_public_ip_on_launch = var.private_subnets_map_public_ip_on_launch
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.project_name}PrivateSubnet(AZ2)"
  }
}

resource "aws_eip" "nat_gateway_elastic_ip_1" {
  vpc = var.nat_gateway_elastic_ip_vpc
  tags = {
    Name = "${var.project_name}ElasticIP1"
  }
}

resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.nat_gateway_elastic_ip_1.allocation_id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "${var.project_name}NatGateway1"
  }
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_eip" "nat_gateway_elastic_ip_2" {
  vpc = var.nat_gateway_elastic_ip_vpc
  tags = {
    Name = "${var.project_name}ElasticIP2"
  }
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = aws_eip.nat_gateway_elastic_ip_2.allocation_id
  subnet_id     = aws_subnet.public_subnet_2.id
  tags = {
    Name = "${var.project_name}NatGateway2"
  }
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${var.project_name}PublicRouteTable"
  }
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_nat_gateway.nat_gateway_1.id
  }
  tags = {
    Name = "${var.project_name}PrivateRoute(AZ1)"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_nat_gateway.nat_gateway_2.id
  }
  tags = {
    Name = "${var.project_name}PrivateRoute(AZ2)"
  }
}

resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
  depends_on     = [aws_route_table.public_route_table]
}

resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
  depends_on     = [aws_route_table.public_route_table]
}

resource "aws_route_table_association" "private_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
  depends_on     = [aws_route_table.private_route_table_1]
}

resource "aws_route_table_association" "private_subnet_2_route_table_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table_2.id
  depends_on     = [aws_route_table.private_route_table_2]
}

resource "aws_security_group" "security_group" {
  description = "Security group for ${var.project_name} application"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = var.from_port_security_group
    to_port     = var.to_port_security_group
    protocol    = var.security_group_rules_protocol
    cidr_blocks = [var.security_group_cidr_block]
  }
  egress {
    from_port   = var.from_port_security_group
    to_port     = var.to_port_security_group
    protocol    = var.security_group_rules_protocol
    cidr_blocks = [var.security_group_cidr_block]
  }
  tags = {
    Name = "${var.project_name}SecurityGroup"
  }
}


########################### LAMBDA FUNCTION RESOURCES ###############################
resource "aws_lambda_layer_version" "dependencies_layer" {
  filename            = var.dependencies_layer_file_name
  layer_name          = "${var.project_name}DependenciesLambdaLayer"
  compatible_runtimes = [var.lambda_function_compatible_runtimes]
}

resource "aws_iam_role" "lambda_iam_role" {
  description = "IAM role for ${var.project_name} application"
  name        = "${var.project_name}LambdaIamRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
    "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
  ]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
    }]
  })
  inline_policy {
    name = "${var.project_name}-cloudwatch-disable"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ]
          Effect   = "Deny"
          Resource = ["arn:aws:logs:*:*:*"]
        },
      ] }
    )
  }
  tags = {
    Name = "${var.project_name}LambdaIamRole"
  }
}

resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.project_name}LambdaFunction"
  runtime       = var.lambda_function_compatible_runtimes
  memory_size   = var.lambda_memory_size
  timeout       = var.lambda_timeout
  handler       = var.lambda_function_handler
  filename      = var.lambda_function_file_name
  role          = aws_iam_role.lambda_iam_role.arn
  layers        = [aws_lambda_layer_version.dependencies_layer.arn]
  vpc_config {
    security_group_ids = [aws_security_group.security_group.id]
    subnet_ids         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  }
  tags = {
    Name = "${var.project_name}LambdaFunction"
  }
}

resource "aws_cloudwatch_event_rule" "lambda_warm_up_events_rule" {
  schedule_expression = var.lambda_warmup_schedule_expression
  tags = {
    Name = "${var.project_name}LambdaWarmUpEventsRule"
  }
}

resource "aws_lambda_permission" "lambda_permission_warm_up" {
  function_name = aws_lambda_function.lambda_function.function_name
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_lambda_function.lambda_function.arn}/${var.environment_name}/*/*"
  depends_on    = [aws_lambda_function.lambda_function]
}

resource "aws_lambda_permission" "lambda_permission_api_gateway" {
  function_name = aws_lambda_function.lambda_function.function_name
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.rest_api.execution_arn}/${var.environment_name}/*/*"
  depends_on    = [aws_api_gateway_rest_api.rest_api]
}

resource "aws_cloudwatch_event_target" "lambda_warm_up_events_target" {
  target_id  = "${var.project_name}lambda_warm_up_events_target"
  arn        = aws_lambda_function.lambda_function.arn
  rule       = aws_cloudwatch_event_rule.lambda_warm_up_events_rule.name
  depends_on = [aws_lambda_permission.lambda_permission_warm_up]
}


############################ API GATEWAY RESOURCES ###############################
resource "aws_api_gateway_rest_api" "rest_api" {
  name = "${var.project_name}ApiRest"
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "${var.project_name}"
      version = "1.0"
    }
    paths = {
      "/{proxy+}" = {
        x-amazon-apigateway-any-method = {
          x-amazon-apigateway-integration = {
            httpMethod           = "POST"
            payloadFormatVersion = "1.0"
            type                 = "AWS_PROXY"
            # It is important to consider $$ for a variable stringfying when it is a stage one. We are going to face it in the value bellow. 
            uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.FunctionName}/invocations"
          }
          responses = {}
        }
      }
    }
    swagger = "2.0"
  })

  tags = {
    Name = "${var.project_name}ApiRest"
  }
}

resource "aws_api_gateway_deployment" "api_gateway_deployment" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
}

resource "aws_api_gateway_stage" "api_gateway_stage" {
  stage_name    = var.environment_name
  deployment_id = aws_api_gateway_deployment.api_gateway_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  variables = {
    FunctionName = "${var.project_name}LambdaFunction"
  }
  tags = {
    Name = "${var.project_name}ApiGatewayStage"
  }
  depends_on = [aws_api_gateway_deployment.api_gateway_deployment]
}