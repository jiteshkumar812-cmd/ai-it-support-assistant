variable "name" {
  type        = string
  description = "Name of the Key Vault."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID."
}

variable "sku_name" {
  type        = string
  description = "Key Vault SKU."
  default     = "standard"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft delete retention in days."
  default     = 90
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable purge protection."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags for the Key Vault."
  default     = {}
}