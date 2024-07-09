variable "cloudflare_api_token" {
  description = "API key for Cloudflare"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "The DNS zone ID in Cloudflare"
  type        = string
}

variable "dns_name" {
  description = "The DNS name to be created in Cloudflare"
  type        = string
}

variable "cluster_ip" {
  description = "The IP address of your Kubernetes cluster"
  type        = string
  validation {
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.cluster_ip))
    error_message = "The IP address is not valid."
  }
}

variable "account_id" {
  description = "The account ID in Cloudflare"
  type        = string
}

variable "domain" {
  description = "The domain name to be created in Cloudflare"
  type        = string
}

variable "proxied" {
  description = "Whether the DNS record is proxied by Cloudflare"
  type        = bool
  default     = false
}

variable "ttl" {
  description = "The TTL for the DNS record"
  type        = number
  default     = 300
}

variable "type" {
  description = "The type of the DNS record"
  type        = string
  default     = "A"
  validation {
    condition     = can(regex("^(A|AAAA|CNAME|TXT|SRV|LOC|MX|NS|SPF|CERT|DNSKEY|DS|KEY|NAPTR|PTR|RRSIG|SOA|TLSA|URI)$", var.type))
    error_message = "The DNS record type is not valid."
  }
}