# DILI-AWS-ECR-IAC
Terraform module for AWS ECR

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create the ECR repository | bool | `true` | no |
| name | Name of the repository | string | `""` | no |
| image_tag_mutability | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to IMMUTABLE | string | `"IMMUTABLE"` | no |
| image_scanning_configuration | Configuration block that defines image scanning configuration for the repository | any | `{}` | no |
| tags | A mapping of tags to assign to the resource | map(string) | `"{}"` | no |
| lifepolicy | The policy document. This is a JSON formatted string | any | null | yes |
| create_life_policy | Whether to create the ECR policy | bool | false | no |
| create_replication | Whether to create the ECR replication | bool | false | no |
| replication_region | A Region to replicate to. | string | null | no |
| replication_account | The account ID of the destination registry to replicate to. | string | null | no |

## Outputs

| Name | Description |
|------|-------------|
| this_ecr_arn | Full ARN of the repository |
| this_ecr_name | The name of the repository |
| this_ecr_registry_id | The registry ID where the repository was created |
| this_ecr_repository_url | The URL of the repository |
