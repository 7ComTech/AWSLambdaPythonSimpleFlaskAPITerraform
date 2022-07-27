output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "To call the account's id whenever we need it"
  sensitive   = true
}

output "swagger_endpoint_url_for_current_stage" {
  value       = "${aws_api_gateway_stage.api_gateway_stage.invoke_url}/teste"
  description = "API Gateway swagger endpoint URL for current stage"
}