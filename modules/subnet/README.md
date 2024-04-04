<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork.subnet_1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dependencies"></a> [dependencies](#input\_dependencies) | n/a | `any` | <pre>{<br>  "gcp": {<br>    "network_name": null,<br>    "project": null,<br>    "region": null,<br>    "zone": null<br>  }<br>}</pre> | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `any` | <pre>{<br>  "ip_cidr_range": null,<br>  "name": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_address"></a> [gateway\_address](#output\_gateway\_address) | n/a |
| <a name="output_ip_cidr_range"></a> [ip\_cidr\_range](#output\_ip\_cidr\_range) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | n/a |
<!-- END_TF_DOCS -->