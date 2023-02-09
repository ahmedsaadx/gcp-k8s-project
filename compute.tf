resource "google_compute_instance" "bastion_host" {
  name         = "bastion-host"
  machine_type = "f1-micro"
  zone = "us-east1-b"

  tags = ["private"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-v20230206"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.management_subnet.self_link

   
  }
  metadata_startup_script = file("script.sh")
  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
  depends_on = [
    google_container_cluster.private
  ]
}



resource "google_container_cluster" "private" {

  name                     = "private"
  location                 = "us-east1-b"

  network                  = google_compute_network.vpc_network.name
  subnetwork               = google_compute_subnetwork.restricted_subnet.name

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
            cidr_block = google_compute_subnetwork.management_subnet.ip_cidr_range
            display_name = "management-subnet"
      
    }
   }

  # Configuration of cluster IP allocation for VPC-native clusters
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  # Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    channel = "REGULAR"
  }
  initial_node_count = 3
  node_config {
    machine_type = "n1-standard-1"
    service_account = google_service_account.service_account1.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    
  }
}






