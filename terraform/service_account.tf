resource "google_service_account" "github_actions" {
  account_id   = "terraform-github-actions"
  display_name = "terraform_github_actions"
  description  = "service account for github actions"
}