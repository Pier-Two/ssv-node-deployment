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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ext_address"></a> [ext\_address](#module\_ext\_address) | terraform-google-modules/address/google | 3.1.2 |
| <a name="module_int_address"></a> [int\_address](#module\_int\_address) | terraform-google-modules/address/google | 3.1.2 |

## Resources

| Name | Type |
|------|------|
| [google_compute_disk.additional_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_disk.boot_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_instance.vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dependencies"></a> [dependencies](#input\_dependencies) | n/a | `any` | <pre>{<br>  "gcp": {<br>    "network_name": null,<br>    "project": null,<br>    "region": null,<br>    "zone": null<br>  }<br>}</pre> | no |
| <a name="input_network"></a> [network](#input\_network) | n/a | `any` | <pre>{<br>  "network_tier": null,<br>  "subnet": {<br>    "ip_cidr_range": null,<br>    "name": null<br>  },<br>  "tags": null<br>}</pre> | no |
| <a name="input_vm"></a> [vm](#input\_vm) | n/a | `any` | <pre>[<br>  {<br>    "additional_disks": {<br>      "data-1": {<br>        "mountpoint": null,<br>        "size": null,<br>        "type": null<br>      },<br>      "data-2": {<br>        "mountpoint": null,<br>        "size": null,<br>        "type": null<br>      }<br>    },<br>    "allow_stopping_for_update": true,<br>    "boot_disk": {<br>      "size": null,<br>      "type": null<br>    },<br>    "deletion_protection": false,<br>    "image": null,<br>    "labels": null,<br>    "machine_type": null,<br>    "metadata": {},<br>    "name": null,<br>    "service_account": {<br>      "email": null,<br>      "scopes": [<br>        "cloud-platform"<br>      ]<br>    },<br>    "zone": null<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm"></a> [vm](#output\_vm) | n/a |
<!-- END_TF_DOCS -->