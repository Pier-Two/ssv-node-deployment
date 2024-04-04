<!-- BEGIN_TF_DOCS -->
# SSV Node Terraform Deployment 

This Terraform project provisions and configures an SSV (Secret Shared Validator) node on Google Cloud Platform (GCP). It sets up the necessary infrastructure, including a virtual machine, subnet, firewall rules, and secret management.

## Prerequisites

- GCP account with appropriate permissions
- Terraform >= 1.4.4 installed
- Ansible (compatible version)

## Usage

1. Clone the repository:

```
git clone https://github.com/your-username/your-repo.git
```

2. Set the required variables in `variables.tf`.

3. Initialize the Terraform working directory:

```
terraform init
```

4. Preview the changes:

```
terraform plan
```
5. Apply the changes:

```
terraform apply
```

## Configuration

The following variables can be configured:

- `gcp_project_id`: The GCP project ID.
- `gcp_region`: The GCP region.
- `gcp_zone`: The GCP zone.
- `vm_name`: The name of the VM.
- `vm_machine_type`: The machine type for the VM.
- `vm_image`: The OS image for the VM.
- `network_subnet_cidr_range`: The IP CIDR range for the subnet.

For a complete list of configurable variables, please refer to the `variables.tf` file.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |

## Modules

| Name | Source | 
|------|--------|
| <a name="module_subnet_1"></a> [subnet\_1](#module\_subnet\_1) | ./modules/subnet | 
| <a name="module_vm"></a> [vm](#module\_vm) | ./modules/vm | 

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.fw_de_allow_2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.fw_de_allow_7](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_secret_manager_secret.encrypted_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_member.encrypted_key_read](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_iam_member.encrypted_key_write](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_iam_member.password_read](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_iam_member.password_write](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_service_account.vm_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket_iam_member.terraform_state_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [null_resource.ansible_vm_app_ssv_bootstrap](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.ansible_vm_app_ssv_deployment](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.ansible_vm_resize_boot_disk](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.ansible_vm_resize_data_disk](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.ansible_vm_server_bootstrap](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_priority"></a> [firewall\_priority](#input\_firewall\_priority) | The priority for the firewall rules | `number` | `1000` | no |
| <a name="input_firewall_source_tags"></a> [firewall\_source\_tags](#input\_firewall\_source\_tags) | List of source tags for the 'fw\_de\_allow\_7' firewall rule | `list(string)` | `[]` | no |
| <a name="input_gcp_network_name"></a> [gcp\_network\_name](#input\_gcp\_network\_name) | The name of the GCP network | `string` | `"default"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID | `string` | `"your-project-id"` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP region | `string` | `"us-central1"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The GCP zone | `string` | `"us-central1-a"` | no |
| <a name="input_network_subnet_cidr_range"></a> [network\_subnet\_cidr\_range](#input\_network\_subnet\_cidr\_range) | The IP CIDR range for the subnet | `string` | `"10.100.105.0/24"` | no |
| <a name="input_network_tier"></a> [network\_tier](#input\_network\_tier) | The network tier for the subnet | `string` | `"PREMIUM"` | no |
| <a name="input_ssh"></a> [ssh](#input\_ssh) | SSH configuration for accessing the VM. Specify the SSH user and the path to the private key file | <pre>object({<br>    type        = string<br>    user        = string<br>    private_key = string<br>  })</pre> | <pre>{<br>  "private_key": "~/.ssh/private_key",<br>  "type": "ssh",<br>  "user": "username"<br>}</pre> | no |
| <a name="input_ssv_consensus_client_endpoint"></a> [ssv\_consensus\_client\_endpoint](#input\_ssv\_consensus\_client\_endpoint) | The consensus client endpoint of Ethereum node | `string` | `"http://localhost:5052"` | no |
| <a name="input_ssv_data_dir"></a> [ssv\_data\_dir](#input\_ssv\_data\_dir) | The data directory for the SSV node. This directory path is appended to the value of 'vm\_data\_disk\_mount\_point' to form the full path for storing SSV node's data | `string` | `"/ssv"` | no |
| <a name="input_ssv_docker_image_tag"></a> [ssv\_docker\_image\_tag](#input\_ssv\_docker\_image\_tag) | The tag for the SSV Docker image | `string` | `"latest"` | no |
| <a name="input_ssv_encrypted_key_secret_id"></a> [ssv\_encrypted\_key\_secret\_id](#input\_ssv\_encrypted\_key\_secret\_id) | The ID of the secret containing the encrypted operator key | `string` | `"sc-ssv-encrypted-key"` | no |
| <a name="input_ssv_execution_client_websocket_endpoint"></a> [ssv\_execution\_client\_websocket\_endpoint](#input\_ssv\_execution\_client\_websocket\_endpoint) | The execution client websocket endpoint of Ethereum node | `string` | `"http://localhost:8546"` | no |
| <a name="input_ssv_metrics_api_port"></a> [ssv\_metrics\_api\_port](#input\_ssv\_metrics\_api\_port) | The Metrics API port for monitoring the SSV node | `number` | `15000` | no |
| <a name="input_ssv_network"></a> [ssv\_network](#input\_ssv\_network) | The Ethereum network for the SSV node to connect with | `string` | `"mainnet"` | no |
| <a name="input_ssv_password_secret_id"></a> [ssv\_password\_secret\_id](#input\_ssv\_password\_secret\_id) | The ID of the secret containing the password | `string` | `"sc-ssv-password"` | no |
| <a name="input_ssv_tcp_port"></a> [ssv\_tcp\_port](#input\_ssv\_tcp\_port) | The TCP port for the SSV node | `number` | `13000` | no |
| <a name="input_ssv_udp_port"></a> [ssv\_udp\_port](#input\_ssv\_udp\_port) | The UDP port for the SSV node | `number` | `12000` | no |
| <a name="input_vm_boot_disk_size"></a> [vm\_boot\_disk\_size](#input\_vm\_boot\_disk\_size) | The size of the boot disk in GB | `number` | `10` | no |
| <a name="input_vm_boot_disk_type"></a> [vm\_boot\_disk\_type](#input\_vm\_boot\_disk\_type) | The type of the boot disk | `string` | `"pd-ssd"` | no |
| <a name="input_vm_data_disk_disk_type"></a> [vm\_data\_disk\_disk\_type](#input\_vm\_data\_disk\_disk\_type) | The type of the data disk | `string` | `"pd-ssd"` | no |
| <a name="input_vm_data_disk_mount_point"></a> [vm\_data\_disk\_mount\_point](#input\_vm\_data\_disk\_mount\_point) | The mount point for the data disk on the VM | `string` | `"/data"` | no |
| <a name="input_vm_data_disk_size"></a> [vm\_data\_disk\_size](#input\_vm\_data\_disk\_size) | The size of the data disk in GB | `number` | `10` | no |
| <a name="input_vm_image"></a> [vm\_image](#input\_vm\_image) | The OS image for the VM | `string` | `"https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2204-jammy-v20230726"` | no |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | The machine type for the VM. See: https://cloud.google.com/compute/docs/machine-types | `string` | `"n1-standard-2"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name of the VM | `string` | `"ssv-node"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssv_encrypted_key_secret_id"></a> [ssv\_encrypted\_key\_secret\_id](#output\_ssv\_encrypted\_key\_secret\_id) | The ID of the secret containing the encrypted operator key |
| <a name="output_ssv_password_secret_id"></a> [ssv\_password\_secret\_id](#output\_ssv\_password\_secret\_id) | The ID of the secret containing the password |
| <a name="output_subnet_gateway_address"></a> [subnet\_gateway\_address](#output\_subnet\_gateway\_address) | The gateway address of the subnet |
| <a name="output_subnet_ip_cidr_range"></a> [subnet\_ip\_cidr\_range](#output\_subnet\_ip\_cidr\_range) | The IP CIDR range of the subnet |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the subnet |
| <a name="output_subnet_self_link"></a> [subnet\_self\_link](#output\_subnet\_self\_link) | The self link of the subnet |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | The name of the VM |

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Make sure to follow the existing code style and provide clear descriptions of your changes.

## License

This project is licensed under the [MIT License](LICENSE).
<!-- END_TF_DOCS -->