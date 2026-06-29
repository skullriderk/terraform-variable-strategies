variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
  default     = "terraform-variables-demo-rg"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Central India"
}