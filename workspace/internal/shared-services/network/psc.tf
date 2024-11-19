locals {
  reserved_peering_ranges = flatten([
    for l1 in var.private_service_access : [
      l1.name
    ]
  ])
}

module "private_service_access" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                  = "../../../../modules/terraform-google-network/modules/terraform-google-private_service_access"
  for_each                = var.private_service_access
  project_id              = var.host_project_id
  vpc_network             = each.value.vpc_name
  address                 = each.value.address
  name                    = each.value.name
  reserved_peering_ranges = local.reserved_peering_ranges
  prefix_length           = 24
}
