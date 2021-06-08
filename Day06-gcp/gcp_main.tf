provider "google" {
  project     = "qwiklabs-gcp-02-7752bd33c1ff"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "qwiklabs-gcp-02-7752bd33c1ff-3fe008faf9bb.json"
}
resource "google_compute_instance" "os1" {
  name         = "os1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


  network_interface {
    network = "default"
  }
}
