profile = "linkage-dev"

# General
region            = "us-east-1"
namespace         = "dev"
resource_tag_name = "linkage"


# AWS SAM
stack_name = "linkage-recruitment-app"

# Github
# Prompt for CodeCommit repo
repo_name           = "linkage-recruitment-service"
repo_default_branch = "master"
poll_source_changes = "true"

# API Gateway
api_gateway_rest_api_id = "qmrgt94w1f" # !Important: Set after AWS SAM is deployed
api_name                = "linkage-api"
api_stage               = "dev"
api_resources = {
  "/api/v1/identity/authorize" = "POST",
  "/api/v1/recruitment/recruitment-requests" = "GET"
}

#Lambda
lambda_function_recruitment_requests_arn  = "arn:aws:lambda:us-east-1:921906086636:function:dev-linkage-recruitment-requests"
lambda_function_identity_authorize_arn     = "arn:aws:lambda:us-east-1:921906086636:function:dev-linkage-identity-authorize"
