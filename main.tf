resource "aws_cloudsearch_domain" "domain" {
  count    = var.create ? 1 : 0
  name     = var.cloudsearch_domain_name
  multi_az = var.multi_az_enabled

  dynamic "endpoint_options" {
    for_each = length(keys(var.endpoint_options)) > 0 ? [true] : []
    content {
      enforce_https       = try(var.endpoint_options["enforce_https"], null)
      tls_security_policy = try(var.endpoint_options["tls_security_policy"], null)
    }
  }

  dynamic "index_field" {
    for_each = var.index_field
    content {
      name            = index_field.value.name
      type            = index_field.value.type
      analysis_scheme = try(index_field.value.analysis_scheme, null)
      default_value   = try(index_field.value.default_value, null)
      facet           = try(index_field.value.facet, null)
      highlight       = try(index_field.value.highlight, null)
      return          = try(index_field.value.return, null)
      search          = try(index_field.value.search, null)
      sort            = try(index_field.value.sort, null)
      source_fields   = try(index_field.value.source_field, null)
    }
  }

  dynamic "scaling_parameters" {
    for_each = length(keys(var.scaling_parameters)) > 0 ? [true] : []
    content {
      desired_instance_type     = try(var.scaling_parameters["desired_instance_type"], null)
      desired_partition_count   = try(var.scaling_parameters["desired_partition_count"], null)
      desired_replication_count = try(var.scaling_parameters["desired_replication_count"], null)
    }
  }
}

resource "aws_cloudsearch_domain_service_access_policy" "access_policy" {
  count         = var.create_access_policy ? 1 : 0
  access_policy = var.access_policy != "" ? var.access_policy : data.aws_iam_policy_document.access_policy[0].json
  domain_name   = aws_cloudsearch_domain.domain[0].name
}

# This will deny all by default if a policy isn't otherwise specified or the statement is not customized
# Customize accordingly
data "aws_iam_policy_document" "access_policy" {
  count = var.access_policy == "" ? 1 : 0
  dynamic "statement" {
    for_each = var.access_policy_statement
    content {
      sid    = try(statement.value.sid, "deny_all")
      effect = try(statement.value.effect, "Deny")
      principals {
        identifiers = try(statement.value.identifiers, ["*"])
        type        = try(statement.value.type, "AWS")
      }
      actions = try(statement.value.actions, ["cloudsearch:*"])
      dynamic "condition" {
        for_each = try(statement.value.condition, [])
        content {
          test     = try(condition.value.test, null)
          values   = try(condition.value.values, null)
          variable = try(condition.value.variable, null)
        }
      }
    }
  }
}
