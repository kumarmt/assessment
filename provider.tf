terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.3.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "6.4.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = var.project
  region      = var.region
}

provider "google-beta" {
  # Configuration options
  project     = var.project
  region      = var.region
}