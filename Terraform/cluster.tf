resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.private_subnet.name

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "nodes"
  cluster  = google_container_cluster.primary.name
  location = var.region

  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
  }
}
