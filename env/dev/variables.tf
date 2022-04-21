variable "profile" {
  description = "AWS Profile used for this deployment"
}

# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "namespace" {
  description = "AWS resource namespace/prefix"
}

variable "region" {
  description = "AWS region"
}

variable "resource_tag_name" {
  description = "Resource name for billing purposes"
}



# -----------------------------------------------------------------------------
# Variables: CodePipeline
# -----------------------------------------------------------------------------
variable "stack_name" {
  type        = string
  description = "AWS SAM stack name"
}


variable "repo_name" {
  type        = string
  description = "Codecommit repository name"
}

variable "repo_default_branch" {
  type        = string
  description = "Codecommit branch name"
  default     = "master"
}

variable "poll_source_changes" {
  type        = string
  default     = "false"
  description = "Periodically check the location of your source content and run the pipeline if changes are detected"
}

# -----------------------------------------------------------------------------
# Variables: Lambda
# -----------------------------------------------------------------------------

variable "lambda_function_recruitment_requests_arn" {
  description = "Lambda function Recruitment Requests  ARN"
}

variable "lambda_function_identity_authorize_arn" {
  description = "Lambda function Identity Authorize ARN"
}

# -----------------------------------------------------------------------------
# Variables: API Gateway
# -----------------------------------------------------------------------------
variable "api_gateway_rest_api_id" {
  description = "API Gateway ID"
}

variable "api_resources" {
  description = "API Resources that require Cloudwatch monitoring"
}

variable "api_name" {
  description = "API Gateway Name"
  type        = string
}

variable "api_stage" {
  description = "API Gateway stage"
  type        = string
}