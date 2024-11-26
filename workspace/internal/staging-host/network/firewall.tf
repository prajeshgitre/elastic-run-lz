
module "create_firewall_rules" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source       = "../../../../modules/terraform-google-network/modules/firewall-rules"
  for_each     = var.firewall_rules_list
  project_id   = each.value.project_id
  network_name = each.value.network_name
  rules        = each.value.rules
  depends_on = [
    module.create_vpc
  ]
}