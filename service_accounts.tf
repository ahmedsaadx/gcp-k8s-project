resource "google_service_account" "service_account" {
  account_id   = "bastion-host-sa"
  display_name = "nastion-serviceA"
}
resource "google_project_iam_member" "attach_permission_to_bastion" {
    project = "saad-375811"
    role = "roles/container.developer"
    member = "serviceAccount:${google_service_account.service_account.email}"
}
