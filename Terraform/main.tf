provider "google" {
  project     = var.project_name
  region      = "us-central1"
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
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = tolist(google_container_cluster.primary.node_locations)[1]
}