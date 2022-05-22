# Local variables
locals {
  tags = {
    Terraform = true
  }

  create = var.create && var.name != ""
}

# ECR
resource "aws_ecr_repository" "this" {
  count                = local.create ? 1 : 0
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  dynamic "image_scanning_configuration" {
    for_each = length(keys(var.image_scanning_configuration)) == 0 ? [] : [var.image_scanning_configuration]

    content {
      scan_on_push = image_scanning_configuration.value.scan_on_push
    }
  }

  tags = merge(
    local.tags,
    var.tags,
  )
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.create_life_policy ? 1 : 0
  repository = aws_ecr_repository.this[0].name
  policy     = var.lifepolicy
}

# resource "aws_ecr_replication_configuration" "this" {
#   count = var.create_replication ? 1 : 0
#   replication_configuration {
#     rule {
#       destination {
#         region      = var.replication_region
#         registry_id = var.replication_account
#       }
#     }
#   }
# }