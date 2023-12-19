output "webapp_resource_group_name" {
  value = azurerm_linux_web_app.webapp.resource_group_name
}

output "app_service_plan" {
  value = azurerm_service_plan.appserviceplan.name
}

output "webapp_name" {
  value = azurerm_linux_web_app.webapp.name
}
