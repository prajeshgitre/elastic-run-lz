//Module for implementing Org policies
module "org-policy" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source            = "../../../modules/terraform-google-org-policy"
  for_each          = { for x in var.org-policy : x.constraint => x }
  constraint        = each.value.constraint
  policy_type       = each.value.policy_type
  policy_for        = each.value.policy_for
  organization_id   = each.value.organization_id
  folder_id         = each.value.folder_id
  project_id        = each.value.project_id
  enforce           = each.value.enforce
  allow             = each.value.allow
  allow_list_length = each.value.allow_list_length
  exclude_folders   = each.value.exclude_folders
  exclude_projects  = each.value.exclude_projects
}
