#####################################################################
# region:  Use VM Module

module "vm" {
  depends_on   = [module.subnet_1]
  source       = "./modules/vm"
  dependencies = local.dependencies

  vm = [
    merge(local.vm, {
      id   = 1
      name = "${var.vm_name}-1"
    })
  ]

  network = local.network.subnet_1
}

# endregion
#####################################################################




