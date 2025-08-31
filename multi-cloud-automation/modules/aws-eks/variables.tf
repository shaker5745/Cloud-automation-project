variable "name" { type = string }
variable "version" { type = string default = "1.29" }
variable "subnet_ids" { type = list(string) }
variable "cluster_role_arn" { type = string }
variable "nodes_role_arn" { type = string }
variable "tags" { type = map(string) default = {} }
