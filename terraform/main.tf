terraform {
  required_providers {
    cockroach = {
      source  = "cockroachdb/cockroach"
      version = "0.2.0"
    }
    upstash = {
      source  = "upstash/upstash"
      version = "1.2.5"
    }
  }
}
