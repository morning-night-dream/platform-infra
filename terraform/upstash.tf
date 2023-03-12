variable "upstash_email" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "upstash_api_key" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "upstash_region" {
  type     = string
  nullable = false
  default  = "us-central1"
}

provider "upstash" {
  email   = var.upstash_email
  api_key = var.upstash_api_key
}

resource "upstash_redis_database" "redis" {
  # 無料プランだと1アカウントにつき1つしか作成できないため
  count         = local.is_prod ? 1 : 0
  database_name = "platform-${var.env}"
  region        = var.upstash_region
  tls           = "true"
}

data "upstash_redis_database_data" "redis_data" {
  count = local.is_prod ? 1 : 0
  # countによりリソースを作成した場合はindex指定が必要  
  database_id = resource.upstash_redis_database.redis[0].database_id
}
