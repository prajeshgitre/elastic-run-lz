module "address" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }

  source       = "../../../../modules/terraform-google-network/modules/terraform_google_address"
  for_each     = { for ip in var.reserve_static_ip : ip.name => ip }
  names        = [each.value.name]
  region       = each.value.region
  project_id   = each.value.project_id
  global       = false
  address_type = each.value.address_type
}

//module to create Cloud_NAT
module "cloud-nat" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                              = "../../../../modules/terraform-google-network/modules/cloud_nat"
  for_each                            = { for nat in var.cloud_nat : nat.nat_name => nat }
  router                              = each.value.router_name
  project_id                          = each.value.project_id
  nat_ips                             = [for i in toset(each.value.static_ip_name) : module.address["${i}"].self_links[0]]
  region                              = each.value.region
  name                                = each.value.nat_name
  network                             = each.value.router_network
  enable_dynamic_port_allocation      = each.value.enable_dynamic_port_allocation
  create_router                       = each.value.create_router
  log_config_enable                   = each.value.log_config_enable
  log_config_filter                   = each.value.log_config_filter
  min_ports_per_vm                    = each.value.min_ports_per_vm
  enable_endpoint_independent_mapping = each.value.enable_endpoint_independent_mapping
  source_subnetwork_ip_ranges_to_nat  = each.value.source_subnetwork_ip_ranges_to_nat
  nat_rules = each.value.nat_rules
}