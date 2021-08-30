# General
variable "project_name" {
    description = "The GCP project name"
}

# Service Account
variable "service_account_id" {
    description = "The service account ID"
}

variable "service_account_display_name" {
    description = "The service account display name"
}
# Container Registry
variable "registry_location" {
    description = "The location of container registry"
    default = "US"
}

# GKE 
variable "cluster_name" {
    description = "The GKE cluster name"
}

variable "cluster_location" {
    description = "The GKE cluster location"
}

## Node Pool

variable "primary_node_pool_name" {
    description = "Name of the primary node pool"
}

variable "primary_node_pool_location" {
    description = "location of the primary node pool"
}

variable "primary_node_pool_node_count" {
    description = "Node count for the primary node pool"
    type = number
}

variable "primary_node_machine_type" {
    description = "The machine type for machines in the primary pool"
}