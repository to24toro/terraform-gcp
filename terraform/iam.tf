# IAM policy

data "google_iam_policy" "workload_identity_user_github_actions" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = ["principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions.name}/attribute.repository/to24toro/terraform-gcp"]
  }
}

resource "google_project_iam_member" "owner_github_actions" {
  project = var.project_id
  role = "roles/owner"
  member = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "github_actions_cloud_storage_admin" {
  project = var.project_id
  role = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM binding

resource "google_service_account_iam_policy" "binding_sa_and_wi_github_actions" {
  service_account_id = google_service_account.github_actions.name
  policy_data        = data.google_iam_policy.workload_identity_user_github_actions.policy_data
}
