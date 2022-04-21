

# -----------------------------------------------------------------------------
#  Modules: CodePipeline
# -----------------------------------------------------------------------------
module "codepipeline" {
  source = "github.com/anilgs/terraform-aws-codepipeline-sam?ref=v1.0"

  resource_tag_name = var.resource_tag_name
  namespace         = var.namespace
  region            = var.region

  repo_name           = var.repo_name
  repo_default_branch = var.repo_default_branch
  poll_source_changes = var.poll_source_changes

  build_image = "aws/codebuild/standard:4.0"

  stack_name = var.stack_name
}

# -----------------------------------------------------------------------------
#  Modules: CloudWatch
# -----------------------------------------------------------------------------

module "cloudwatch_alarms_apigateway" {
  source = "github.com/anilgs/terraform-aws-cloudwatch-alarms?ref=v1.0"

  namespace         = var.namespace
  region            = var.region
  resource_tag_name = var.resource_tag_name

  create_errorRate_alarm       = false
  create_throttleCount_alarm   = false
  create_canary_alarm          = false
  create_iteratorAge_alarm     = false
  create_deadLetterQueue_alarm = false

  api_name  = var.api_name
  api_stage = var.api_stage
  resources = var.api_resources
}

# -----------------------------------------------------------------------------
#  Modules: Lambda services
# -----------------------------------------------------------------------------
module "identity_authorize" {
  source = "../../services/identity_authorize"

  resource_tag_name = var.resource_tag_name
  namespace         = var.namespace
  region            = var.region

  lambda_function_identity_authorize_arn = var.lambda_function_identity_authorize_arn

  api_gateway_rest_api_id = var.api_gateway_rest_api_id
}

module "recruitment_requests" {
  source = "../../services/recruitment_requests"

  resource_tag_name = var.resource_tag_name
  namespace         = var.namespace
  region            = var.region


  lambda_function_recruitment_requests_arn         = var.lambda_function_recruitment_requests_arn

  api_gateway_rest_api_id = var.api_gateway_rest_api_id
}

# -----------------------------------------------------------------------------
#  Module: Systems Manager Parameter Store
# -----------------------------------------------------------------------------
module "ssm_parameters" {
  source = "github.com/rpstreef/terraform-aws-ssm-parameter-store?ref=master"

  application_name = var.resource_tag_name
  environment      = var.namespace

  parameters = {
    
    "identity_authorize_role_arn" = {
      "type"  = "String"
      "value" = module.identity_authorize.iam_arn
    }
    "recruitment_requests_role_arn" = {
      "type"  = "String"
      "value" = module.recruitment_requests.iam_arn
    },
    "sns_topic_arn" = {
      "type"  = "String"
      "value" = module.recruitment_requests.sns_topic_arn
    }
  }
}
