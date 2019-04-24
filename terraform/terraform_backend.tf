terraform {
  backend "gcs" {
    bucket  = "terraform-state"
    prefix  = "ruby-floripa-demo/apery-state"
  }
}