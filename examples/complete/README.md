# complete

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.35.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudsearch"></a> [cloudsearch](#module\_cloudsearch) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_document_service_endpoint"></a> [document\_service\_endpoint](#output\_document\_service\_endpoint) | n/a |
| <a name="output_domain_arn"></a> [domain\_arn](#output\_domain\_arn) | n/a |
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | n/a |
| <a name="output_search_service_endpoint"></a> [search\_service\_endpoint](#output\_search\_service\_endpoint) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
