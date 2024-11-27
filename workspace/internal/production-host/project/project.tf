//Resource for adding suffix to project_id
resource "random_id" "project_id_suffix" {
  byte_length = 1
}

//Module for creation of project under common service folder
module "create_project" {
    providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source          = "../../../../modules/terraform-google-projects"
  for_each        = var.projects_list
  name            = each.value.project_name
  parent          = each.value.project_folder
  prefix          = each.value.prefix
  labels          = each.value.labels
  project_id      = format("%s%s", each.value.project_id, random_id.project_id_suffix.hex)
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}

#Module to budget notification channel
module "host_project_budget_notification_channel" {
      providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  for_each                  = var.projects_list
  source                    = "../../../../modules/terraform-google-budgets/monitoring_notification_channel"
  notification_display_name = "Notification channel for ${module.create_project[each.key].project_id}"
  notification_type         = "email"
  notification_project      = var.notification_project_id
  email_address             = var.notification_email
  depends_on                = [module.create_project]
}

#Module to create budget alert
module "budget_host_project" {
    providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source            = "../../../../modules/terraform-google-budgets"
  for_each          = var.projects_list
  billing_account   = var.billing_account
  project_name      = module.create_project[each.key].project_id
  projects          = [module.create_project[each.key].number]
  amount            = var.amount
  thresholds        = var.thresholds
  notification_name = [module.host_project_budget_notification_channel["${each.key}"].id]
  depends_on        = [module.host_project_budget_notification_channel]
}
