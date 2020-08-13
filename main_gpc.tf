terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  credentials = file("My First Project-12345abcdefg.json")

  project = "indigo-winter-286100"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-b	
"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
