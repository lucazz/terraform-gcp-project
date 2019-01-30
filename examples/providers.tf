provider "google" {
  credentials = "${file("~/.config/gcloud/terraform-serviceaccount.json")}"
  region      = "us-west1"
}

provider "google-beta" {
  credentials = "${file("~/.config/gcloud/terraform-serviceaccount.json")}"
  region      = "us-west1"
}
