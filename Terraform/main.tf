provider "google" {
  project     = var.project_name
  region      = "us-central1"
}

resource "google_service_account" "kube-account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_container_registry" "registry" {
  project  = var.project_name
  location = var.registry_location
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.cluster_location

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.primary_node_pool_name
  location   = var.primary_node_pool_location
  cluster    = google_container_cluster.primary.name
  node_count = var.primary_node_pool_node_count

  node_config {
    preemptible  = true
    machine_type = var.primary_node_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kube-account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}