terraform {
  backend "gcs" {
    bucket  = "gke-terraform-state-1"
    prefix  = "terraform/state/develop"
  }
}