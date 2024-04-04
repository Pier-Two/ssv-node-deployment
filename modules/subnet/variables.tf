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
# region: Subnet

variable "subnet" {
  type = any
  default = {
    name          = null
    ip_cidr_range = null
  }
}

# endregion
#####################################################################
