variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "address_space" {
  type        = list(string)
  description = "VNet address space."
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  description = "Map of subnets."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags for the VNet."
  default     = {}
}