resource "azurerm_key_vault" "kvstore" {
  name                        = var.akv_name
  location            = var.region
  resource_group_name = var.rg

  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku_name
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "example-endpoint"
  location            = var.region
  resource_group_name = var.rg
  subnet_id                   = var.subnet

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_key_vault.kvstore.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.kvstore.id
  tenant_id    = var.tenant_id
  object_id    = var.object_id


  secret_permissions = [
    "Get",
    "List", 
    "Set", 
    "Recover"
  ]
} 
