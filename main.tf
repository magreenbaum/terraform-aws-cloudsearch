resource "aws_cloudsearch_domain" "domain" {
  count    = var.create ? 1 : 0
  name     = var.cloudsearch_domain_name
  multi_az = var.multi_az_enabled

  dynamic "endpoint_options" {
    for_each = length(var.endpoint_options) > 0 ? [true] : []
    content {
      enforce_https       = try(endpoint_options.value.enforce_https, null)
      tls_security_policy = try(endpoint_options.value.tls_security_policy, null)
    }
  }

  dynamic "index_field" {
    for_each = var.index_field
    content {
      name            = index_field.value.name
      type            = index_field.value.type
      analysis_scheme = lookup(index_field.value, "analysis_scheme", null)
      default_value   = lookup(index_field.value, "default_value", null)
      facet           = lookup(index_field.value, "facet", null)
      highlight       = lookup(index_field.value, "highlight", null)
      return          = lookup(index_field.value, "return", null)
      search          = lookup(index_field.value, "search", null)
      sort            = lookup(index_field.value, "sort", null)
      source_fields   = lookup(index_field.value, "source_field", null)
    }
  }

  dynamic "scaling_parameters" {
    for_each = length(var.scaling_parameters) > 0 ? [true] : []
    content {
      desired_instance_type     = try(scaling_parameters.value.desired_instance_type, null)
      desired_partition_count   = try(scaling_parameters.value.desired_partition_count, null)
      desired_replication_count = try(scaling_parameters.value.desired_replication_count, null)
    }
  }
}

resource "aws_cloudsearch_domain_service_access_policy" "access_policy" {
  count         = var.create_access_policy ? 1 : 0
  access_policy = var.access_policy
  domain_name   = aws_cloudsearch_domain.domain[0].name
}