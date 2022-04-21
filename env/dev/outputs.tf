

output "identity_authorize_role_arn" {
  value = module.identity_authorize.iam_arn
}

output "recruitment_requests_role_arn" {
  value = module.recruitment_requests.iam_arn
}

output "sns_topic_arn" {
  value = module.recruitment_requests.sns_topic_arn
}