#####################################################################
# region: GCP Dependencies

locals {
  dependencies = {
    gcp = {
      project      = var.gcp_project_id
      region       = var.gcp_region 
      zone         = var.gcp_zone
      network_name = var.gcp_network_name
    }
  }
}

# endregion
#####################################################################
# region: VM

locals {
  vm = {
    name         = var.vm_name
    machine_type = var.vm_machine_type
    zone         = var.gcp_zone
    image        = var.vm_image
    boot_disk = {
      size = var.vm_boot_disk_size
      type = var.vm_boot_disk_type
    }
    additional_disks = {
      data1 = {
        size       = var.vm_data_disk_size
        type       = var.vm_data_disk_disk_type
        mountpoint = var.vm_data_disk_mount_point
      }
    }
    allow_stopping_for_update = true
    deletion_protection       = false
    labels = {
    }
    metadata = {
    }
    service_account = {
      email  = google_service_account.vm_service_account.email
      scopes = ["cloud-platform"]
    }
  }
}

# endregion
#####################################################################
# region: Network

locals {
  network = {
    subnet_1 = {
      network_tier = var.network_tier
      tags         = ["fw-sb-${var.vm_name}"]
      subnet = {
        name          = "sb-${var.vm_name}"
        ip_cidr_range = var.network_subnet_cidr_range
      }
    }
  }
}

# endregion
#####################################################################
# region: SSV

locals {
  ssv = {
    network = {
      blockchain   = var.ssv_network
      cc_endpoint  = var.ssv_consensus_client_endpoint
      ec_endpoint  = var.ssv_execution_client_websocket_endpoint
      tcp_port     = var.ssv_tcp_port
      udp_port     = var.ssv_udp_port
      metrics_port = var.ssv_metrics_api_port
    }
    secrets = {
      encrypted_key_id = var.ssv_encrypted_key_secret_id
      password_id      = var.ssv_password_secret_id
    }
    data_dir  = "${var.vm_data_disk_mount_point}${var.ssv_data_dir}"
    image_tag = var.ssv_docker_image_tag
  }
}

# endregion
#####################################################################
