variable "create" {
  description = "Whether to create the ECR repository"
  type        = bool
  default     = true
}

variable "create_life_policy" {
  description = "Whether to create the ECR policy"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the repository"
  type        = string
  default     = ""
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to IMMUTABLE"
  type        = string
  default     = "INMUTABLE"
}

variable "image_scanning_configuration" {
  description = "Configuration block that defines image scanning configuration for the repository"
  type        = any
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "lifepolicy" {
  description = "The policy document. This is a JSON formatted string"
  type        = any
  default     = null
}

variable "create_replication" {
  description = "Whether to create the ECR replication"
  type        = bool
  default     = false
}
variable "replication_region" {
  description = "A Region to replicate to"
  type        = string
  default     = null
}

variable "replication_account" {
  description = "The account ID of the destination registry to replicate to."
  type        = string
  default     = null
}