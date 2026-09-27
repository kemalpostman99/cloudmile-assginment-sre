provider "google" {
  project = var.project_id
  region  = var.region
}

# 1. Create Cloud Storage Bucket
resource "google_storage_bucket" "nexus_blob_store" {
  name          = "${var.project_id}-nexus-blobstore"
  location      = var.region
  force_destroy = true
}

# 2. Create GKE Cluster (with 1 preemptible node n1-standard-1)
resource "google_container_cluster" "primary" {
  name     = "nexus-cluster"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "nexus-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
  }
}