resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
  provider = google-beta.project-beta
  project  = var.host_project_id
}

module "net-shared-vpc-access" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source              = "../../../../modules/terraform-google-network/modules/fabric-net-svpc-access"
  host_project_id     = var.host_project_id
  service_project_ids = var.service_project_ids
  host_subnets        = var.host_subnets
  host_subnet_regions = var.host_subnet_regions
  host_subnet_users   = var.host_subnet_users
  depends_on          = [google_compute_shared_vpc_host_project.shared_vpc_host, module.create_vpc]
}