variable "project_name" {
  
}
variable "container_name" {
    description = "Name of the container used for GCR"
}

variable "container_location" {
    description = "The location of container"
    default = "US"
}