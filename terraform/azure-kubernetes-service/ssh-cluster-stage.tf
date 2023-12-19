resource "azapi_resource" "ssh_public_key_stage" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = "SSH-pub-key-stage-cluster"
  location  = azurerm_resource_group.stage.location
  parent_id = azurerm_resource_group.stage.id
}

resource "azapi_resource_action" "ssh_public_key_gen_stage" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key_stage.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

output "stage_key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen_stage.output).publicKey
}