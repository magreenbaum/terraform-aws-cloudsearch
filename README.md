# terraform-aws-cloudsearch

Provisions AWS CloudSearch Resources.

Note that use of this module is intended to create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudsearch_domain.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudsearch_domain) | resource |
| [aws_cloudsearch_domain_service_access_policy.access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudsearch_domain_service_access_policy) | resource |
| [aws_iam_policy_document.access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policy"></a> [access\_policy](#input\_access\_policy) | The access rules you want to configure. These rules replace any existing rules | `string` | `""` | no |
| <a name="input_access_policy_statement"></a> [access\_policy\_statement](#input\_access\_policy\_statement) | n/a | `any` | `[]` | no |
| <a name="input_cloudsearch_domain_name"></a> [cloudsearch\_domain\_name](#input\_cloudsearch\_domain\_name) | The name of the CloudSearch domain | `string` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Whether or not to create a cloudsearch domain | `bool` | `true` | no |
| <a name="input_create_access_policy"></a> [create\_access\_policy](#input\_create\_access\_policy) | Whether or not to create a cloudsearch domain service access policy | `bool` | `true` | no |
| <a name="input_endpoint_options"></a> [endpoint\_options](#input\_endpoint\_options) | Domain endpoint options | `list(any)` | `[]` | no |
| <a name="input_index_field"></a> [index\_field](#input\_index\_field) | The index fields for documents added to the domain | `list(any)` | `[]` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Whether or not to maintain extra instances for the domain in a second Availability Zone to ensure high availability | `bool` | `false` | no |
| <a name="input_scaling_parameters"></a> [scaling\_parameters](#input\_scaling\_parameters) | Domain scaling parameters | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_document_service_endpoint"></a> [document\_service\_endpoint](#output\_document\_service\_endpoint) | The service endpoint for updating documents in a search domain |
| <a name="output_domain_arn"></a> [domain\_arn](#output\_domain\_arn) | The domain's ARN |
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | An internally generated unique identifier for the domain |
| <a name="output_search_service_endpoint"></a> [search\_service\_endpoint](#output\_search\_service\_endpoint) | The service endpoint for requesting search results from a search domain |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
