#####################################################################
# region: Outputs

output "vm_name" {
  description = "The name of the VM"
  value       = module.vm.vm[0].name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.subnet_1.name
}

output "subnet_ip_cidr_range" {
  description = "The IP CIDR range of the subnet"
  value       = module.subnet_1.ip_cidr_range
}

output "subnet_gateway_address" {
  description = "The gateway address of the subnet"
  value       = module.subnet_1.gateway_address
}

output "subnet_self_link" {
  description = "The self link of the subnet"
  value       = module.subnet_1.self_link
}

output "ssv_encrypted_key_secret_id" {
  description = "The ID of the secret containing the encrypted operator key"
  value       = var.ssv_encrypted_key_secret_id
}

output "ssv_password_secret_id" {
  description = "The ID of the secret containing the password"
  value       = var.ssv_password_secret_id
}

# endregion
#####################################################################