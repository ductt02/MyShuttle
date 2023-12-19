provider "azurerm" {
  # alias   = "stage"
  skip_provider_registration = "true"
  features {}
}

resource "azurerm_resource_group" "stage" {
  name     = "stage-rg"
  location = "East US"

  tags = {
    environment = "Stage"
  }
}

data "azurerm_key_vault" "stage_kv" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_keyvault
}

data "azurerm_key_vault_secret" "sp_apId_stage" {
  name         = var.keyvault_secret_name_SPApId    # Secret name in Key Vault
  key_vault_id = data.azurerm_key_vault.stage_kv.id # Key Vault ID
}

data "azurerm_key_vault_secret" "sp_password_stage" {
  name         = var.keyvault_secret_name_SPPassword # Secret name in Key Vault
  key_vault_id = data.azurerm_key_vault.stage_kv.id  # Key Vault ID
}

resource "azurerm_kubernetes_cluster" "stage_cluster" {
  # provider = azurerm.stage
  name                = "stage-aks-cluster"
  location            = azurerm_resource_group.stage.location
  resource_group_name = azurerm_resource_group.stage.name
  dns_prefix          = "stage-aks"
  kubernetes_version  = "1.27.3"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen_stage.output).publicKey
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  service_principal {
    client_id     = data.azurerm_key_vault_secret.sp_apId_stage.value
    client_secret = data.azurerm_key_vault_secret.sp_password_stage.value
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Stage"
  }
}
