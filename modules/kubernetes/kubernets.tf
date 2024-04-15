resource "google_container_cluster" "bravo" {
  name     = "ezout-bravo-auto"
  location = var.region
  network =  var.vpc_id
  subnetwork = var.subnet_id
  initial_node_count       = 1
  deletion_protection = false
  enable_autopilot = true
}
# resource "google_container_cluster" "torchserve_cluster" {
#   name     = "ezout-bravo"
#   location = var.region
#   network =  var.vpc_id
#   subnetwork = var.subnet_id

#   node_pool {
#     name               = "node-zoro"
#     initial_node_count = 1

#     node_config {
#       machine_type = "n1-standard-4"

#       guest_accelerator {
#         type  = "nvidia-tesla-t4"
#         count = 1
#       }
#     }
#   }
# }

# ... rest of your configurations

# ... rest of your configurations
# resource "google_container_node_pool" "master_node" {
#   name       = "master"
#   cluster    = google_container_cluster.primary.id
#   node_count = 1

#   node_config {
#     preemptible  = true
#     machine_type = "e2-medium"

#     service_account = "ezout-service-applications@ezout-vision-402700.iam.gserviceaccount.com1"
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }
# resource "google_container_node_pool" "cluster_node" {
#   name       = "cluster"
#   cluster    = google_container_cluster.primary.id
#   node_config {
#     service_account = "ezout-service-applications@ezout-vision-402700.iam.gserviceaccount.com1"
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#     guest_accelerator {
#       type  = "nvidia-tesla-k80"
#       count = 1
#     }
#   }
# }