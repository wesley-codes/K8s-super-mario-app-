variable "cluster_name" {
  type = string

}

variable "subnets_id" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "eks_version" {
  description = "The version of eks_cluster"
  default     = "1.31"

}

variable "eks_cluster_role_arn" {
  type = string
}


# variable "dependency" {
#     type = string 
# }
