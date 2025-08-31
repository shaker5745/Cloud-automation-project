variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnet_prefixes" { type = list(string) }
variable "cluster_name" { type = string }
variable "tags" { type = map(string) default = {} }
