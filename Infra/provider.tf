###########################################################################################
#                                     PROVIDER                                            #
###########################################################################################
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      ProjectName    = var.project_name
      CompanyName    = var.company_name
      Owner          = var.owner
      ProjectType    = var.project_type
      Environment    = var.environment_name
      Terraform      = true
      Cloudformation = false
    }
  }
}
