#####################################################################
# region: Secrets - SSV Node Operator

resource "google_secret_manager_secret" "encrypted_key" {
  secret_id = local.ssv.secrets.encrypted_key_id

  labels = {
    # Add any labels to the secret that are relevant
  }

  # Warning: Changing replication values will cause deletion
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "password" {
  secret_id = local.ssv.secrets.password_id

  labels = {
    # Add any labels to the secret that are relevant
  }

  # Warning: Changing replication values will cause deletion
  replication {
    auto {}
  }
}

# endregion
#####################################################################
# region: Grant read and write access for the encrypted key secret

resource "google_secret_manager_secret_iam_member" "encrypted_key_read" {
  secret_id = google_secret_manager_secret.encrypted_key.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.vm_service_account.email}"
}

resource "google_secret_manager_secret_iam_member" "encrypted_key_write" {
  secret_id = google_secret_manager_secret.encrypted_key.secret_id
  role      = "roles/secretmanager.secretVersionManager"
  member    = "serviceAccount:${google_service_account.vm_service_account.email}"
}

# endregion
#####################################################################
# region: Grant read and write access for the password secret

resource "google_secret_manager_secret_iam_member" "password_read" {
  secret_id = google_secret_manager_secret.password.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.vm_service_account.email}"
}

resource "google_secret_manager_secret_iam_member" "password_write" {
  secret_id = google_secret_manager_secret.password.secret_id
  role      = "roles/secretmanager.secretVersionManager"
  member    = "serviceAccount:${google_service_account.vm_service_account.email}"
}

# endregion
#####################################################################
