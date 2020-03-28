output "bastion_ip" {
  value = azurerm_public_ip.bastionIP.ip_address
}