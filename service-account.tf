#####################################################################
# region: Service Account & Permissions

resource "google_service_account" "vm_service_account" {
  account_id   = "sv-${var.vm_name}"
  display_name = "sv-${var.vm_name}"
}

resource "google_storage_bucket_iam_member" "terraform_state_iam" {
  bucket = "your-gcs-bucket-name"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.vm_service_account.email}"
}

# endregion
#####################################################################






