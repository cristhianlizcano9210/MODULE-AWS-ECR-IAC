output "this_ecr_arn" {
  description = "Full ARN of the repository"
  value       = element(concat(aws_ecr_repository.this.*.arn, [""]), 0)
}

output "this_ecr_name" {
  description = "The name of the repository"
  value       = element(concat(aws_ecr_repository.this.*.name, [""]), 0)
}

output "this_ecr_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_repository.this.*.registry_id, [""]), 0)
}

output "this_ecr_repository_url" {
  description = "The URL of the repository"
  value       = element(concat(aws_ecr_repository.this.*.repository_url, [""]), 0)
}
