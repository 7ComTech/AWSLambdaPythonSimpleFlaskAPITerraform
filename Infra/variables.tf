################################### PROVIDER VARIABLES ####################################
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

################################### PROJECT VARIABLES #####################################
variable "environment_name" {
  type        = string
  description = "Environment name"
  default     = "DEV"
}

variable "project_name" {
  description = "The project name that will be prefixed to resource names"
  type        = string
  default     = "TestProject"
}

variable "company_name" {
  description = "The name of the client company"
  type        = string
  default     = "TestCompany"
}

variable "owner" {
  description = "The name of the owner of the resource"
  type        = string
  default     = "TestOwner"
}

variable "project_type" {
  description = "Project type from SCA API Builder"
  type        = string
  default     = "TestType"
}

############################### BASE RESOURCES VARIABLES #################################
variable "vpc_cidr" {
  description = "Please enter the IP range (CIDR notation) for this VPC"
  type        = string
  default     = "10.192.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "Please enter the IP range (CIDR notation) for this VPC"
  type        = string
  default     = "10.192.10.0/24"
}

variable "public_subnet_2_cidr" {
  description = "Please enter the IP range (CIDR notation) for the public subnet in the second Availability Zone"
  type        = string
  default     = "10.192.11.0/24"
}

variable "private_subnet_1_cidr" {
  description = "Please enter the IP range (CIDR notation) for the private subnet in the first Availability Zone"
  type        = string
  default     = "10.192.20.0/24"
}

variable "private_subnet_2_cidr" {
  description = "Please enter the IP range (CIDR notation) for the private subnet in the second Availability Zone"
  type        = string
  default     = "10.192.21.0/24"
}

variable "route_table_cidr_block" {
  description = "CIDR Block for route tables."
  type        = string
  default     = "0.0.0.0/0"
}

variable "security_group_cidr_block" {
  description = "CIDR Block for Security Group's ingress and egress rules."
  type        = string
  default     = "0.0.0.0/0"
}

variable "security_group_rules_protocol" {
  description = "Protocol for Security Group's rules"
  type        = string
  default     = "tcp"
}

variable "from_port_security_group" {
  description = "Starting of the port range for the Security Group's rules"
  type        = number
  default     = 0
}

variable "to_port_security_group" {
  description = "Ending of the port range for the Security Group's rules"
  type        = number
  default     = 65535
}

variable "vpc_dns_support" {
  type        = bool
  description = "To enable or disable dns_suport on vpc"
  default     = true
}

variable "vpc_dns_hostnames" {
  type        = bool
  description = "To enable or disable dns_hostnames on vpc"
  default     = true
}

variable "public_subnets_map_public_ip_on_launch" {
  type        = bool
  description = "To set as true for mapping public ip on launch"
  default     = true
}

variable "private_subnets_map_public_ip_on_launch" {
  type        = bool
  description = "To set as false for mapping public ip on launch"
  default     = false
}

variable "nat_gateway_elastic_ip_vpc" {
  type        = bool
  description = "To set as false for mapping public ip on launch"
  default     = true
}

#################################### LAMBDA VARIABLES ###################################
variable "lambda_memory_size" {
  description = "Memory Size for lambda function "
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "Timeout for lambda function "
  type        = number
  default     = 29
}

variable "lambda_warm_up_events_state" {
  description = "State for warm up lambda function "
  type        = string
  default     = "disabled"
}

variable "lambda_function_compatible_runtimes" {
  description = "Compatible runtimes of the lambda function"
  type        = string
  default     = "python3.8"
}

variable "lambda_function_handler" {
  description = "Lambda Function Handler"
  type        = string
  default     = "app.lambda_handler"
}

variable "dependencies_layer_file_name" {
  description = "Lambda Dependencies Layer file_name"
  type        = string
  default     = "../DependenciesLayer/DependenciesLayer.zip"
}

variable "lambda_function_file_name" {
  description = "Lambda Function file_name"
  type        = string
  default     = "../LambdaFunction/LambdaFunction.zip"
}

variable "lambda_warmup_schedule_expression" {
  description = "Schedule Expression for Lambda Warm Up Events Rule"
  type        = string
  default     = "rate(5 minutes)"
}