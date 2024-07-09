terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"  # Specify the version you want to use
    }
  }

  required_version = ">= 0.12"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "cluster_dns_record" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_name
  value   = var.cluster_ip
  type    = var.type
  ttl     = var.ttl
  proxied = var.proxied
}
