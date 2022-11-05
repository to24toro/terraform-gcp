# resource "google_storage_bucket" "terraform-state" {
#   name     = "terraform-bucket"
#   location = var.region
#   storage_class = "STANDARD"

#   versioning {
#     enabled = true
#   }

#   lifecycle_rule {
#     action {
#       type = "Delete"
#     }
#     condition {
#       num_newer_versions = 5
#     }
#   }
# }