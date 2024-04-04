#####################################################################
# region: VM

resource "google_compute_instance" "vm" {
  for_each = { for s in var.vm : s.id => s }

  name                      = each.value.name
  machine_type              = each.value.machine_type
  labels                    = each.value.labels
  project                   = var.dependencies.gcp.project
  zone                      = each.value.zone
  allow_stopping_for_update = each.value.allow_stopping_for_update
  deletion_protection       = each.value.deletion_protection
  tags                      = var.network.tags

  boot_disk {
    source      = google_compute_disk.boot_disk[each.key].id
    device_name = google_compute_disk.boot_disk[each.key].name
  }

  dynamic "attached_disk" {
    for_each = [for k, v in google_compute_disk.additional_disk : v if split("-", k)[0] == each.key] 

    content {
      source      = attached_disk.value.id
      device_name = replace(attached_disk.value.name, "dk-${each.value.name}-", "")
    }
  }

  network_interface {
    network    = var.dependencies.gcp.network_name
    subnetwork = var.network.subnet.name
    network_ip = module.int_address[each.key].addresses[0] 
    access_config {
      nat_ip = module.ext_address[each.key].addresses[0]
    }
  }

  service_account {
    email  = each.value.service_account.email
    scopes = each.value.service_account.scopes
  }

  metadata = each.value.metadata
}

# endregion
#####################################################################
