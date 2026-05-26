variable "location" {
  type        = string
  description = "Azure region for bootstrap resources."
}

variable "tfstate_resource_group_name" {
  type        = string
  description = "Resource group name for Terraform state resources."
}

variable "tfstate_storage_account_name" {
  type        = string
  description = "Globally unique storage account name for Terraform state."
}

variable "tfstate_container_name" {
  type        = string
  description = "Blob container name for Terraform state."
  default     = "tfstate"
}

variable "tags" {
  type        = map(string)
  description = "Common tags."
  default     = {}
}
