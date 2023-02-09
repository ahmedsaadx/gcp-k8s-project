terraform {
  required_providers {
    google= {
        source = "hashicorp/google"
        version = "4.50.0"
    }
  }
}
provider "google" {
  project = "saad-375811"
  region = "us-east1"

}