terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-resource-group"  # Use the output from Step 1
    storage_account_name = "tfstatestorageacct17483" # Use the output from Step 1
    container_name       = "tfstate"                 # Use the output from Step 1
    key                  = "app-service.tfstate"
  }
}
