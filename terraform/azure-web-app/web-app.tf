provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "assignment5-app-service-plan"
  location            = var.rg-location
  resource_group_name = var.rg-name
  os_type             = "Linux"
  sku_name            = "S1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "assignment5-wa"
  location              = var.rg-location
  resource_group_name   = var.rg-name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true

  site_config { 
    minimum_tls_version = "1.2"
	  # always_on = false
  }
}

resource "azurerm_linux_web_app_slot" "stage" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    minimum_tls_version = "1.2"
  }
}