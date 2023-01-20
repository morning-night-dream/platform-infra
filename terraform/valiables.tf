variable "env" {
  type        = string
  nullable    = false
  description = "environment"
}

locals {
  is_prod = var.env == "prod"
}
