variable "name" {
  type        = string
  description = "Name of the Azure Container Registry."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "sku" {
  type        = string
  description = "ACR SKU."
  default     = "Standard"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ACR."
  default     = {}
}