output "domain_arn" {
  description = "The domain's ARN"
  value       = try(aws_cloudsearch_domain.domain[0].arn, "")
}

output "document_service_endpoint" {
  description = "The service endpoint for updating documents in a search domain"
  value       = try(aws_cloudsearch_domain.domain[0].document_service_endpoint, "")
}

output "domain_id" {
  description = "An internally generated unique identifier for the domain"
  value       = try(aws_cloudsearch_domain.domain[0].domain_id, "")
}

output "search_service_endpoint" {
  description = "The service endpoint for requesting search results from a search domain"
  value       = try(aws_cloudsearch_domain.domain[0].search_service_endpoint, "")
}
