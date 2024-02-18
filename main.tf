#--------------------------
# Storage Account Creation 
#--------------------------
resource "azurerm_storage_account" "storeaccount" {
  name                      = var.storage_account_name
  resource_group_name       = var.rg_name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  min_tls_version           = var.min_tls_version
  enable_https_traffic_only = true

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
    }
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = var.tags
}