#####################################################################
# region: Interfaces

module "int_address" {
  for_each = { for s in var.vm : s.id => s }

  source       = "terraform-google-modules/address/google"
  version      = "3.1.2"
  project_id   = var.dependencies.gcp.project
  region       = var.dependencies.gcp.region
  subnetwork   = var.network.subnet.name
  names        = ["ip-int-${each.value.name}"]
  address_type = "INTERNAL"
  network_tier = var.network.network_tier
}

module "ext_address" {
  for_each = { for s in var.vm : s.id => s }

  source       = "terraform-google-modules/address/google"
  version      = "3.1.2"
  project_id   = var.dependencies.gcp.project
  region       = var.dependencies.gcp.region
  names        = ["ip-ext-${each.value.name}"]
  address_type = "EXTERNAL"
  network_tier = var.network.network_tier
}

# endregion
#####################################################################
