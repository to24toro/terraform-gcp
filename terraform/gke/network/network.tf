resource "google_computer_network" "example" {
    name = local.gke_name
    auto_create_subnetworks = false
    # lifecycle {
    #   prevent_destroy = true
    # }
}

resource "google_computer_subnetwork" "example_1" {
  name = local.gke_name
  region = var.region
  ip_cidr_range = var.subnet_cidr_range
  network = google_computer_network.example.self_link
  private_ip_google_address = true
}

# resource "google_computer_subnetwork" "example_2" {
#   name = local.gke_name
#   region = var.region
#   ip_cidr_range = var.subnet_cidr_range
#   network = google_computer_network.example.self_link
#   private_ip_google_address = true
# }