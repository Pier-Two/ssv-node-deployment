#####################################################################
# region: Boot Disk 

resource "google_compute_disk" "boot_disk" {
  for_each = { for s in var.vm : s.id => s }

  name  = "dk-${each.value.name}"
  zone  = each.value.zone
  size  = each.value.boot_disk.size
  type  = each.value.boot_disk.type
  image = each.value.image
}

# endregion
#####################################################################
# region: Additional disks

resource "google_compute_disk" "additional_disk" {
  for_each = { for item in flatten([
    for s in var.vm :
    [for disk_name, disk_config in s.additional_disks :
      {
        vm_id     = s.id,
        vm_name   = s.name,
        vm_zone   = s.zone,
        disk_name = disk_name,
        disk_size = disk_config.size,
        disk_type = disk_config.type
    }]
  ]) : "${item.vm_id}-${item.disk_name}" => item }

  name = "dk-${each.value.vm_name}-${each.value.disk_name}"
  zone = each.value.vm_zone
  size = each.value.disk_size
  type = each.value.disk_type
}
# endregion
#####################################################################