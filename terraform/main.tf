terraform {
  backend "gcs" {
    bucket  = "terraform-bucket"
  }
}