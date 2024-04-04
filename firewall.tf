#####################################################################
# region: Allow other internet nodes to connect with SSV node (Ingress)

resource "google_compute_firewall" "fw_de_allow_2" {
  name        = "fw-de-allow-${local.vm.name}-2"
  network     = var.gcp_network_name
  description = "Allow P2P node connections from the internet"
  priority    = var.firewall_priority
  allow {
    protocol = "tcp"
    ports    = ["${local.ssv.network.tcp_port}"]
  }
  allow {
    protocol = "udp"
    ports    = ["${local.ssv.network.udp_port}"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = local.network.subnet_1.tags
}

# endregion
#####################################################################
# region: Monitoring (Ingress)

resource "google_compute_firewall" "fw_de_allow_7" {
  name        = "fw-de-allow-${local.vm.name}-7"
  network     = var.gcp_network_name
  description = "Allow inbound monitoring connections"
  priority    = var.firewall_priority

  allow {
    protocol = "tcp"
    ports    = ["${local.ssv.network.metrics_port}"]
  }

  source_tags = var.firewall_source_tags
  target_tags = local.network.subnet_1.tags
}

# endregion
#####################################################################
