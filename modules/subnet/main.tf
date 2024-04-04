#####################################################################
# region: Network

resource "google_compute_subnetwork" "subnet_1" {
  name          = var.subnet.name
  ip_cidr_range = var.subnet.ip_cidr_range
  network       = var.dependencies.gcp.network_name
}

# endregion
#####################################################################
