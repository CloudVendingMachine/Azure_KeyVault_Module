variable "rg" {
  type = string
  description = "rg"
}

variable "region" {
  type = string
  description = "Region"
}

variable "akv_name" {
  type        = string
  description = "AKV Name"
}
variable "enabled_for_disk_encryption" {
  type        = string
}

variable "soft_delete_retention_days" {
  type        = string
}
variable "purge_protection_enabled" {
  type        = string
}
variable "sku_name" {
  type        = string
}
variable "subnet" {
  type        = string
}
variable "tenant_id" {
  type        = string
}
variable "diagsa" {
  type        = string
}
variable "object_id" {
  type        = string
}
variable "environment_name" {}
variable "short_name" {}
variable "region_shortname" {}