# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "stage_resource_group_name" {
  value = azurerm_resource_group.stage.name
}

# output "production_resource_group_name" {
#   value = azurerm_resource_group.production.name
# }

output "stage_kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.stage_cluster.name
}

# output "SPApID" {
#   value = nonsensitive(data.azurerm_key_vault_secret.sp_apId_stage.value)
# }

# output "SPPassword" {
#   value = nonsensitive(data.azurerm_key_vault_secret.sp_password_stage.value)
# }
# output "production_kubernetes_cluster_name" {
#   value = azurerm_kubernetes_cluster.production_cluster.name
# }

# output "kubeconfig_production" {
#   value = azurerm_kubernetes_cluster.production_cluster.kube_config_raw
# }

# output "kubeconfig_stage" {
#   sensitive = true
#   value = azurerm_kubernetes_cluster.stage_cluster.kube_config_raw
# }

# output "host" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.host
# }

# output "client_key" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
# }

# output "cluster_username" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.username
# }

# output "cluster_password" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.password
# }
