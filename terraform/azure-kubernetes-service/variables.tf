variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size for nodes in cluster"
  default     = "Standard_B2s"
}

variable "keyvault_name" {
  type        = string
  description = "Name of keyvault"
  default     = "KeVault-SPForTerraform"
}

variable "resource_group_keyvault" {
  type        = string
  description = "Resoure group for keyvault"
  default     = "keyvaults-rg"
}

variable "keyvault_secret_name_SPApId" {
  type        = string
  description = "Name of SP app ID secret in keyvault"
  default     = "sp-apid"
}

variable "keyvault_secret_name_SPPassword" {
  type        = string
  description = "Name of SP password secret in keyvault"
  default     = "sp-password"
}

/*
variable "aks-cluster-rg-name" {
  type        = string
  description = "Name of resource group for aks cluster"
  default     = "devops-rg"
}

variable "aks-cluster-rg-location" {
  type        = string
  description = "Location of resource group for aks cluster"
  default     = "East US"
}
*/