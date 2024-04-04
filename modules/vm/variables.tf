#####################################################################
# region: Dependencies

variable "dependencies" {
  type = any
  default = {
    gcp = {
      project      = null
      region       = null
      zone         = null
      network_name = null
    }
  }
}

# endregion
#####################################################################
# region: VM Variable

variable "vm" {
  type = any
  default = [{
    name         = null
    machine_type = null
    zone         = null
    image        = null
    boot_disk = {
      size = null
      type = null
    }
    additional_disks = {
      data-1 = {
        size = null
        type = null
        mountpoint = null
      },
      data-2 = {
        size = null
        type = null
        mountpoint = null
      }
    }
    allow_stopping_for_update = true
    deletion_protection       = false
    labels                    = null
    metadata = {
    }
    service_account = {
      email  = null
      scopes = ["cloud-platform"]
    }
  }]

}

# endregion
#####################################################################
# region: Network 

variable "network" {
  type = any
  default = {
    network_tier = null
    tags         = null
    subnet = {
      name          = null
      ip_cidr_range = null
    }
  }
}

# endregion
#####################################################################


