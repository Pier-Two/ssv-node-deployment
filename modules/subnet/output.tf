#####################################################################
# region: Outputs

output "name" {
  value = google_compute_subnetwork.subnet_1.name
}

output "ip_cidr_range" {
  value = google_compute_subnetwork.subnet_1.ip_cidr_range
}

output "gateway_address" {
  value = google_compute_subnetwork.subnet_1.gateway_address
}

output "self_link" {
  value = google_compute_subnetwork.subnet_1.self_link
}

# endregion
#####################################################################