provider "aws" {
  region = "us-west-2"
}
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
}
