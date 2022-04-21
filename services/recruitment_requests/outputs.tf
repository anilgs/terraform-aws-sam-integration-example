output "iam_arn" {
  value = module.iam.role_arn
}

output "sns_topic_arn" {
  value = module.sns.sns_topic_arn_lambda
}

output "recruitment_requests_canary_alarm_arn" {
  value = module.cloudwatch_alarms_recruitment_requests.canary_alarm_arn
}

