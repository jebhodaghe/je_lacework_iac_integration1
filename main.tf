provider "google" {
  credentials = file("path/to/your/credentials.json")  # Replace with the actual path to your GCP service account key JSON file
  project     = "your-gcp-project-id"  # Replace with your GCP project ID
  region      = "us-central1"  # Replace with your desired region
}

resource "google_storage_bucket" "example_bucket" {
  name          = "your-unique-bucket-name"  # Replace with your desired bucket name
  location      = "US"  # Replace with your desired bucket location
  force_destroy = true  # Use with caution; set to true to allow deletion of non-empty bucket

  versioning {
    enabled = true  # Enable versioning for the bucket
  }

  # Access control for the bucket (optional)
  iam_configuration {
    bindings {
      role    = "roles/storage.objectViewer"  # Example: Give read-only access to all objects
      members = ["allUsers"]
    }
  }
}
