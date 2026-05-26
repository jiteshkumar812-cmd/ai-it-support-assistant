variable "location" {
  type        = string
  description = "Azure region for dev resources."
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID."
}

variable "tags" {
  type        = map(string)
  description = "Common tags for dev resources."
  default     = {}
}
