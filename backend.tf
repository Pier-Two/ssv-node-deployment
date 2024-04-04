#####################################################################
# region: GCS Terraform Statefile Storage

terraform {
  backend "gcs" {
    bucket = "your-gcs-bucket-name"
    prefix = "your-prefix"
  }
}

# endregion
#####################################################################