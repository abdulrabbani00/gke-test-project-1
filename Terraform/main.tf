provider "google" {
  project     = var.project_name
  region      = "us-central1"
}


resource "google_storage_bucket" "container_bucket" {
  name          = var.container_name
  location      = var.container_location
  force_destroy = true

}

resource "google_container_registry" "registry" {
  project  = var.project_name
  location = var.container_location
}