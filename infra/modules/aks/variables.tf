variable "name" {
  type        = string
  description = "Name of the AKS cluster."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS."
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes version."
  default     = null
}

variable "default_node_pool_name" {
  type        = string
  description = "Default node pool name."
  default     = "system"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool."
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "VM size for nodes."
  default     = "Standard_DS2_v2"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for AKS nodes."
}

variable "acr_id" {
  type        = string
  description = "Azure Container Registry resource ID."
}

variable "tags" {
  type        = map(string)
  description = "Tags for AKS."
  default     = {}
}