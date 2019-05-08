terraform {
  backend "gcs" {
    bucket  = "apery-terraform-state"
    prefix  = "devopsfloripa-demo/apery-state"
  }
}