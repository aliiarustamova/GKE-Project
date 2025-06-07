provider "google" {
  project = "gke-project-462018" 
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name = "public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region = "us-central1"
  network = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name = "private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region = "us-central1"
  network = google_compute_network.vpc_network.id
  private_ip_google_access = true
}
