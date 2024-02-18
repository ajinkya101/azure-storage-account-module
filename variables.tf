variable "location" {
  description = "Azure location for deployment"
  default     = "East US"
}

variable "rg_name" {
  type        = string
  description = "Name of an Resource Group"
}

variable "storage_account_name" {
  type        = string
  description = "Specifies the name of the storage account"
}

variable "account_kind" {
  type        = string
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = "StorageV2"
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid."
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "LRS"
}

variable "min_tls_version" {
  type        = string
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2."
  default     = "TLS1_2"
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = object({ bypass = list(string), ip_rules = list(string), subnet_ids = list(string) })
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}