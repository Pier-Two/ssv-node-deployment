#####################################################################
# region: GCP Provider

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "your-project-id"  
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"  
}

variable "gcp_zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"  
}

variable "gcp_network_name" {
  description = "The name of the GCP network"
  type        = string
  default     = "default"
}

# endregion
#####################################################################
# region: VM 

variable "vm_name" {
  description = "The name of the VM"
  type        = string
  default     = "ssv-node"
}

variable "vm_image" {
  description = "The OS image for the VM"
  type        = string
  default     = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2204-jammy-v20230726"
}

variable "vm_machine_type" {
  description = "The machine type for the VM. See: https://cloud.google.com/compute/docs/machine-types"
  type        = string
  default     = "n1-standard-2"
}

variable "vm_boot_disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 10
}

variable "vm_boot_disk_type" {
  description = "The type of the boot disk"
  type        = string
  default     = "pd-ssd"
}

variable "vm_data_disk_size" {
  description = "The size of the data disk in GB"
  type        = number
  default     = 10
}

variable "vm_data_disk_disk_type" {
  description = "The type of the data disk"
  type        = string
  default     = "pd-ssd"
}

variable "vm_data_disk_mount_point" {
  description = "The mount point for the data disk on the VM"
  type        = string
  default     = "/data"
}

# endregion
#####################################################################
# region: Network

variable "network_tier" {
  description = "The network tier for the subnet"
  type        = string
  default     = "PREMIUM"
}

variable "network_subnet_cidr_range" {
  description = "The IP CIDR range for the subnet"
  type        = string
  default     = "10.100.105.0/24"
}

# endregion
#####################################################################
# region: Firewall

variable "firewall_priority" {
  description = "The priority for the firewall rules"
  type        = number
  default     = 1000
}

variable "firewall_source_tags" {
  description = "List of source tags for the 'fw_de_allow_7' firewall rule"
  type        = list(string)
  default     = []
}

# endregion
#####################################################################
# region: SSV 

variable "ssv_network" {
  description = "The Ethereum network for the SSV node to connect with"
  type        = string
  default     = "mainnet"
}

variable "ssv_data_dir" {
  description = "The data directory for the SSV node. This directory path is appended to the value of 'vm_data_disk_mount_point' to form the full path for storing SSV node's data"
  type        = string
  default     = "/ssv"
}

variable "ssv_encrypted_key_secret_id" {
  description = "The ID of the secret containing the encrypted operator key"
  type        = string
  default     = "sc-ssv-encrypted-key"
}

variable "ssv_password_secret_id" {
  description = "The ID of the secret containing the password"
  type        = string
  default     = "sc-ssv-password"
}

variable "ssv_consensus_client_endpoint" {
  description = "The consensus client endpoint of Ethereum node"
  type        = string
  default     = "http://localhost:5052"
}

variable "ssv_execution_client_websocket_endpoint" {
  type        = string
  default     = "http://localhost:8546"
  description = "The execution client websocket endpoint of Ethereum node"
}

variable "ssv_tcp_port" {
  type        = number
  default     = 13000
  description = "The TCP port for the SSV node"
}

variable "ssv_udp_port" {
  type        = number
  default     = 12000
  description = "The UDP port for the SSV node"
}

variable "ssv_metrics_api_port" {
  type        = number
  default     = 15000
  description = "The Metrics API port for monitoring the SSV node"
}

variable "ssv_docker_image_tag" {
  type        = string
  default     = "latest"
  description = "The tag for the SSV Docker image"
}

# endregion
#####################################################################
# region: SSH 

variable "ssh" {
  type = object({
    type        = string
    user        = string
    private_key = string
  })
  default = {
    type        = "ssh"
    user        = "username"
    private_key = "~/.ssh/private_key"
  }
  description = "SSH configuration for accessing the VM. Specify the SSH user and the path to the private key file"
}

# endregion
##################################################################### 
