terraform {
  backend "gcs" {
    bucket  = "apery-terraform-state"
    prefix  = "ruby-floripa-demo/apery-state"
  }
}