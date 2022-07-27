####################################### DATA ##############################################
# DATA TO SET DE AWS AZ'S AS AVAILABLE, WE ARE GOING TO USE THEM IN OUR SUBNETS STACK
data "aws_availability_zones" "available" {
  state = "available"
}
# DATA TO CALL THE ACCOUNT'S ID BY OUTPUT'S VALUE WHENEVER WE NEED IT
# FOR NOW, WE ARE APPLYING IT ONLY IN THE REST_API URI, BUT WE HAVE DECIDED 
# TO PLACE THE DATA'S AT BASE RESOURCES
data "aws_caller_identity" "current" {}