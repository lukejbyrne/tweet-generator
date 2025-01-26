output "app_service_url" {
  value       = azurerm_linux_web_app.tweet_generator.default_hostname
  description = "URL of the deployed Linux Web App"
}
