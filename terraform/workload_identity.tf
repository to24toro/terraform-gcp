# github actions用プール
resource "google_iam_workload_identity_pool" "github_actions" {
  provider                  = google-beta
  project                   = var.project_id
  workload_identity_pool_id = "github-actions"
  description               = "workload identity pool for github actions"
  disabled                  = false
}

# github actions用プロバイダ
resource "google_iam_workload_identity_pool_provider" "github_actions" {
  provider                           = google-beta
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions"
  description                        = "workload identity pool provider for github actions"

  # https://cloud.google.com/iam/docs/configuring-workload-identity-federation
  # ID プロバイダの認証情報を外部 ID にマッピングする属性マッピングを定義
  # google.subject : ユーザーの一意の識別子。ロールバインディングで使用され、Cloud Logging のログに表示される
  # attribute. : 特定の属性を持つすべての ID にアクセス権を付与
  attribute_mapping                  = {
    "google.subject"       = "assertion.sub"        # リポジトリ名と Git リファレンス
    "attribute.actor"      = "assertion.actor"      # Github Actions を実行したユーザーアカウント
    "attribute.repository" = "assertion.repository" # オーナーとリポジトリ名
  }
  oidc { issuer_uri = "https://token.actions.githubusercontent.com" }
}

