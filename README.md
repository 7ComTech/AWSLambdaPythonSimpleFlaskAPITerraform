<!-- BEGIN_TF_DOCS -->
>> ### IF YOU ENJOY OUR REPOS, REACH OUT VIA EMAIL OR SOCIAL MEDIA FOR CUSTOMIZED SOLUTIONS 

>> ### DON'T FORGET TO RATE THIS REPO IF YOU FIND IT USEFUL!!!

<br/>

# AWS Lambda Function - Python Simple Flask API Terraform
This repo contains a project ready for deployment on AWS with the following features*:
 - A Python Flask simple API (/LambdaFunction)
 - Serverless AWS Infratsructure on Terraform IaC (/Infra)
 - Dedicated dependencies layer directory (/DependenciesLayer)

This project based is on the infrastructure provided by our product SCA: An API builder that generates a full CRUD API with swagger definitions to map any relational database with a complete and secure AWS infrastructure. We're able to provide your project with several infrastrucutures with all the features contained within this project and other customizable resources such as: Cognito for Authentication/Authorization, WAF (Web Application Firewalls), ElastiCache (Redis or Memcached) for low latency applications and full logging capabilities powered by Cloudwatch or Centralized Logs features (S3 + Glue + Athena).
For more information, visit our page and send us an inquiry: [SevenTechnologies](https://seventechnologies.cloud/)

## Requirements

Terraform CLI, AWS CLI and AWS Account.

</br>

## Deployment
Run the init command.
> > terraform init

Then, apply.

> > terraform apply

To destroy your infrastructure, run:

> > terraform destroy

### Requirements
Terraform CLI, AWS CLI

</br>

## Post Deployment

* ALTER INBOUND AND OUTBOUND RULES FROM SECURITY GROUPS IF NECESSARY

</br>

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.6.0 |

</br>

## Technologies

| Name | Version |
|------|---------|
| <a name="python"></a> [Python38](#technology\_python) | 3.8.13 |
| <a name="terraformm"></a> [Terraform](#technology\_terraform) | 1.1.6|

</br>

## Modules

No modules.

</br>

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_deployment.api_gateway_deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_rest_api.rest_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.api_gateway_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_event_rule.lambda_warm_up_events_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda_warm_up_events_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_eip.nat_gateway_elastic_ip_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.nat_gateway_elastic_ip_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_role.lambda_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_layer_version.dependencies_layer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_permission.lambda_permission_api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.lambda_permission_warm_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_nat_gateway.nat_gateway_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_route_table_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet_1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet_2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet_1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet_2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_company_name"></a> [company\_name](#input\_company\_name) | The name of the client company | `string` | `"TestCompany"` | no |
| <a name="input_dependencies_layer_file_name"></a> [dependencies\_layer\_file\_name](#input\_dependencies\_layer\_file\_name) | Lambda Dependencies Layer file\_name | `string` | `"./DependenciesLayer/DependenciesLayer.zip"` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Environment name | `string` | `"DEV"` | no |
| <a name="input_from_port_security_group"></a> [from\_port\_security\_group](#input\_from\_port\_security\_group) | Starting of the port range for the Security Group's rules | `number` | `0` | no |
| <a name="input_lambda_function_compatible_runtimes"></a> [lambda\_function\_compatible\_runtimes](#input\_lambda\_function\_compatible\_runtimes) | Compatible runtimes of the lambda function | `string` | `"python3.8"` | no |
| <a name="input_lambda_function_file_name"></a> [lambda\_function\_file\_name](#input\_lambda\_function\_file\_name) | Lambda Function file\_name | `string` | `"./LambdaFunction/LambdaFunction.zip"` | no |
| <a name="input_lambda_function_handler"></a> [lambda\_function\_handler](#input\_lambda\_function\_handler) | Lambda Function Handler | `string` | `"app.lambda_handler"` | no |
| <a name="input_lambda_memory_size"></a> [lambda\_memory\_size](#input\_lambda\_memory\_size) | Memory Size for lambda function | `number` | `128` | no |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | Timeout for lambda function | `number` | `29` | no |
| <a name="input_lambda_warm_up_events_state"></a> [lambda\_warm\_up\_events\_state](#input\_lambda\_warm\_up\_events\_state) | State for warm up lambda function | `string` | `"disabled"` | no |
| <a name="input_lambda_warmup_schedule_expression"></a> [lambda\_warmup\_schedule\_expression](#input\_lambda\_warmup\_schedule\_expression) | Schedule Expression for Lambda Warm Up Events Rule | `string` | `"rate(5 minutes)"` | no |
| <a name="input_nat_gateway_elastic_ip_vpc"></a> [nat\_gateway\_elastic\_ip\_vpc](#input\_nat\_gateway\_elastic\_ip\_vpc) | To set as false for mapping public ip on launch | `bool` | `true` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The name of the owner of the resource | `string` | `"TestOwner"` | no |
| <a name="input_private_subnet_1_cidr"></a> [private\_subnet\_1\_cidr](#input\_private\_subnet\_1\_cidr) | Please enter the IP range (CIDR notation) for the private subnet in the first Availability Zone | `string` | `"10.192.20.0/24"` | no |
| <a name="input_private_subnet_2_cidr"></a> [private\_subnet\_2\_cidr](#input\_private\_subnet\_2\_cidr) | Please enter the IP range (CIDR notation) for the private subnet in the second Availability Zone | `string` | `"10.192.21.0/24"` | no |
| <a name="input_private_subnets_map_public_ip_on_launch"></a> [private\_subnets\_map\_public\_ip\_on\_launch](#input\_private\_subnets\_map\_public\_ip\_on\_launch) | To set as false for mapping public ip on launch | `bool` | `false` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name that will be prefixed to resource names | `string` | `"TestProject"` | no |
| <a name="input_project_type"></a> [project\_type](#input\_project\_type) | Project type from SCA API Builder | `string` | `"TestType"` | no |
| <a name="input_public_subnet_1_cidr"></a> [public\_subnet\_1\_cidr](#input\_public\_subnet\_1\_cidr) | Please enter the IP range (CIDR notation) for this VPC | `string` | `"10.192.10.0/24"` | no |
| <a name="input_public_subnet_2_cidr"></a> [public\_subnet\_2\_cidr](#input\_public\_subnet\_2\_cidr) | Please enter the IP range (CIDR notation) for the public subnet in the second Availability Zone | `string` | `"10.192.11.0/24"` | no |
| <a name="input_public_subnets_map_public_ip_on_launch"></a> [public\_subnets\_map\_public\_ip\_on\_launch](#input\_public\_subnets\_map\_public\_ip\_on\_launch) | To set as true for mapping public ip on launch | `bool` | `true` | no |
| <a name="input_route_table_cidr_block"></a> [route\_table\_cidr\_block](#input\_route\_table\_cidr\_block) | CIDR Block for route tables. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_security_group_cidr_block"></a> [security\_group\_cidr\_block](#input\_security\_group\_cidr\_block) | CIDR Block for Security Group's ingress and egress rules. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_security_group_rules_protocol"></a> [security\_group\_rules\_protocol](#input\_security\_group\_rules\_protocol) | Protocol for Security Group's rules | `string` | `"tcp"` | no |
| <a name="input_to_port_security_group"></a> [to\_port\_security\_group](#input\_to\_port\_security\_group) | Ending of the port range for the Security Group's rules | `number` | `65535` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Please enter the IP range (CIDR notation) for this VPC | `string` | `"10.192.0.0/16"` | no |
| <a name="input_vpc_dns_hostnames"></a> [vpc\_dns\_hostnames](#input\_vpc\_dns\_hostnames) | To enable or disable dns\_hostnames on vpc | `bool` | `true` | no |
| <a name="input_vpc_dns_support"></a> [vpc\_dns\_support](#input\_vpc\_dns\_support) | To enable or disable dns\_suport on vpc | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | To call the account's id whenever we need it |
| <a name="output_swagger_endpoint_url_for_current_stage"></a> [swagger\_endpoint\_url\_for\_current\_stage](#output\_swagger\_endpoint\_url\_for\_current\_stage) | API Gateway swagger endpoint URL for current stage |

## Social Medias
* [Linkedin](https://www.linkedin.com/company/7community/)
* [Instagram-PTBR](https://www.instagram.com/7comtech/)

## Email
* sales@seventechnologies.cloud

<!-- END_TF_DOCS -->