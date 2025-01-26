provider "azurerm" {
  features {}

  subscription_id = "15bf39bd-005b-41d5-ae94-ff7a9cff417d"
}

resource "azurerm_resource_group" "app_service_rg" {
  name     = "tweet-generator-rg"
  location = "West Europe" # Adjust to your preferred Azure region
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "tweet-generator-plan"
  resource_group_name = azurerm_resource_group.app_service_rg.name
  location            = azurerm_resource_group.app_service_rg.location
  os_type             = "Linux"
  sku_name            = "B1" # F1 for free
}

resource "azurerm_linux_web_app" "tweet_generator" {
  name                = "tweet-generator-app"
  location            = azurerm_resource_group.app_service_rg.location
  resource_group_name = azurerm_resource_group.app_service_rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack {
      python_version = "3.9"
    }
    always_on = true # change to false if using F1
    app_command_line = "gunicorn -w 4 -b 0.0.0.0:$PORT app:app"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "HUGGING_FACE_API_KEY"     = var.hugging_face_api_key
  }
}

resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.tweet_generator.id
  repo_url           = "https://github.com/lukejbyrne/tweet-generator"
  branch             = "main"
  use_manual_integration = true
  use_mercurial      = false
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "tweetgeneratorstorage"
  resource_group_name      = azurerm_resource_group.app_service_rg.name
  location                 = azurerm_resource_group.app_service_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

/*
Watch logs in terminal by running 

az webapp log tail --resource-group tweet-generator-rg --name tweet-generator-app

*/