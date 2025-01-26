provider "azurerm" {
  features {}

  subscription_id = "15bf39bd-005b-41d5-ae94-ff7a9cff417d"
}

resource "azurerm_resource_group" "tf_state_rg" {
  name     = "tfstate-resource-group"
  location = "West Europe" # Adjust as needed
}

resource "azurerm_storage_account" "tf_state" {
  name                     = "tfstatestorageacct17483"  # Must be globally unique
  resource_group_name      = azurerm_resource_group.tf_state_rg.name
  location                 = azurerm_resource_group.tf_state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tf_state_container" {
  name                  = "tfstate"
  storage_account_id  = azurerm_storage_account.tf_state.id
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.tf_state.name
}

output "container_name" {
  value = azurerm_storage_container.tf_state_container.name
}

output "resource_group_name" {
  value = azurerm_resource_group.tf_state_rg.name
}
