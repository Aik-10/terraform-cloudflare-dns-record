output "cloudflare_record_id" {
  description = "The ID of the created DNS record in Cloudflare"
  value       = cloudflare_record.cluster_dns_record.id
}
