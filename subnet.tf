#####################################################################
# region: Use Subnet Module

module "subnet_1" {
  source = "./modules/subnet"

  dependencies = local.dependencies

  subnet = {
    name          = local.network.subnet_1.subnet.name
    ip_cidr_range = local.network.subnet_1.subnet.ip_cidr_range
  }

}

# endregion
#####################################################################

