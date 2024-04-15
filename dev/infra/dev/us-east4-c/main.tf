provider "google" {
  project = var.project
  region  = var.zones
  
}

terraform {
  backend "gcs" {
    bucket = "kubernetes-ezout"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

module "network" {
  source = "../../../../modules/networks"  
  region = var.region
  project = var.project
}

module "kubernetes" {
  source = "../../../../modules/kubernetes"  
  region = var.region
  project = var.project
  vpc_id =  module.network.vpc_id
  subnet_id = module.network.subnet_id
}
# module "nfs" {
#   source = "../../../../modules/nfs"
#   zone = var.zones
# }