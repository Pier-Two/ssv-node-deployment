#####################################################################
# region: Providers 

provider "google" {
  project = var.dependencies.gcp.project
  region  = var.dependencies.gcp.region
  zone    = var.dependencies.gcp.zone
}

terraform {
  required_version = ">= 1.4.4"
}

# endregion
#####################################################################
