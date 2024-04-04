#####################################################################
# region: Ansible Server Setup

resource "null_resource" "ansible_vm_server_bootstrap" {
  for_each = { for s in module.vm.vm : s.id => s }

  depends_on = [module.vm]

  triggers = {
    ansibleConfig = filesha256("./ansible/server/bootstrap.yaml")
    vmZone        = jsonencode(each.value.zone)
    vmImage       = jsonencode(each.value.image)
    vmDiskType    = jsonencode(each.value.boot_disk.type)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]
    connection {
      type        = "ssh"
      user        = var.ssh.user
      private_key = file("${var.ssh.private_key}")
      host        = each.value.name
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${each.value.name}, --private-key '${var.ssh.private_key}' --user ${var.ssh.user} ansible/server/bootstrap.yaml --extra-vars 'disks=${jsonencode(each.value.additional_disks)}'"
  }
}

# endregion
#####################################################################
# region: SSV Node Bootstrap

resource "null_resource" "ansible_vm_app_ssv_bootstrap" {
  for_each = { for s in module.vm.vm : s.id => s }

  depends_on = [module.vm, null_resource.ansible_vm_server_bootstrap]

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]
    connection {
      type        = "ssh"
      user        = var.ssh.user
      private_key = file("${var.ssh.private_key}")
      host        = each.value.name
    }
  }

  # Run playbook
  provisioner "local-exec" {
    command = "ansible-playbook -i ${each.value.name}, --private-key '${var.ssh.private_key}' --user ${var.ssh.user} ansible/app/ssv_operator_bootstrap.yaml --extra-vars '{ssv: ${jsonencode(local.ssv)}}'"
  }
}

# endregion
#####################################################################
# region: SSV Node Deployment

resource "null_resource" "ansible_vm_app_ssv_deployment" {
  for_each = { for s in module.vm.vm : s.id => s }

  depends_on = [module.vm, null_resource.ansible_vm_server_bootstrap, null_resource.ansible_vm_app_ssv_bootstrap]

  triggers = {
    ansibleConfig = filesha256("./ansible/app/ssv_operator_deployment.yaml")
    appConfig     = jsonencode(local.ssv)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]
    connection {
      type        = "ssh"
      user        = var.ssh.user
      private_key = file("${var.ssh.private_key}")
      host        = each.value.name
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${each.value.name}, --private-key '${var.ssh.private_key}' --user ${var.ssh.user} ansible/app/ssv_operator_deployment.yaml --extra-vars '{ssv: ${jsonencode(local.ssv)}}'"
  }
}

# endregion
#####################################################################
# region: Resize Boot Disk

resource "null_resource" "ansible_vm_resize_boot_disk" {
  for_each = { for s in module.vm.vm : s.id => s }

  depends_on = [module.vm, null_resource.ansible_vm_server_bootstrap, null_resource.ansible_vm_app_ssv_bootstrap, null_resource.ansible_vm_app_ssv_deployment]

  triggers = {
    vmDiskSize = jsonencode(each.value.boot_disk.size)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]
    connection {
      type        = "ssh"
      user        = var.ssh.user
      private_key = file("${var.ssh.private_key}")
      host        = each.value.name
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${each.value.name}, --private-key '${var.ssh.private_key}' --user ${var.ssh.user} ansible/server/resize-disk.yaml --extra-vars 'disk_name=dk-${each.value.name}' --extra-vars 'partition_id=1'"
  }
}

# endregion
#####################################################################
# region: Resize Data Node Disk

resource "null_resource" "ansible_vm_resize_data_disk" {
  for_each = { for s in module.vm.vm : s.id => s }

  depends_on = [module.vm, null_resource.ansible_vm_server_bootstrap, null_resource.ansible_vm_app_ssv_bootstrap, null_resource.ansible_vm_app_ssv_deployment, null_resource.ansible_vm_resize_boot_disk]

  triggers = {
    vmDiskSize = jsonencode(each.value.additional_disks.data1.size)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]
    connection {
      type        = "ssh"
      user        = var.ssh.user
      private_key = file("${var.ssh.private_key}")
      host        = each.value.name
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${each.value.name}, --private-key '${var.ssh.private_key}' --user ${var.ssh.user} ansible/server/resize-disk.yaml --extra-vars 'disk_name=dk-${each.value.name}' --extra-vars 'partition_id=1'"
  }
}

# endregion
#####################################################################
