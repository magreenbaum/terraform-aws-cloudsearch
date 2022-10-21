provider "aws" {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}

module "cloudsearch" {
  source = "../../"

  cloudsearch_domain_name = "test"
  endpoint_options = [
    {
      enforce_https       = true
      tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    }
  ]

  index_field = [
    {
      name = "price"
      type = "double"
    },
    {
      name   = "main"
      type   = "text"
      search = true
    }
  ]

  scaling_parameters = [
    {
      desired_instance_type = "search.small"
    }
  ]

  access_policy_statement = [
    {
      sid         = "search_only"
      effect      = "Allow"
      identifiers = [data.aws_caller_identity.current.id]
      type        = "AWS"
      actions = [
        "cloudsearch:search",
        "cloudsearch:document"
      ]
      condition = [
        {
          test     = "IpAddress"
          values   = ["10.10.10.10/32"]
          variable = "aws:SourceIp"
        }
      ]
    }
  ]
}
