module "create_vpc" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                                 = "../../../../modules/terraform-google-network"
  for_each                               = var.vpc_list
  network_name                           = each.value.vpc_name
  project_id                             = each.value.project_id
  delete_default_internet_gateway_routes = each.value.delete_default_internet_gateway_routes
  subnets                                = each.value.subnets
  secondary_ranges                       = each.value.secondary_ranges
}