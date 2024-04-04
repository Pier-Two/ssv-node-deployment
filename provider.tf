#####################################################################
# region: Providers (docs: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# endregion
#####################################################################
