# Org-Folders

This module helps create several folders under the same parent, enforcing consistent permissions, and with a common naming convention.

The resources/services/activations/deletions that this module will create/trigger are:

- Create folders with the provided names.
- Create Sub-envoirment folders.
- Apply policies for Sub-enviornment folders.
- Create Centralized logging for Sub-enviornment folders.
- Create Notification channel at BU Level
- Assign the log storge permissions to the provided list of users or groups.

## Usage

#  Project

This module allows you to create Host projects. It
creates projects and configures aspects like Billing budget, notification channel.

## Usage

```hcl
module "create_project" {
  source          = "../../../modules/terraform-google-project-factory"
  for_each        = var.projects_list
  name            = each.value.project_name
  project_id      = format("%s%s", each.value.project_id, random_id.project_id_suffix.hex)
  folder_id       = each.value.project_folder
  labels          = each.value.labels
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}
```
# Creation of project from tfvars
project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}
projects_list = {
  proj1 = {
    prefix         = "prj"
    project_name   = "prod-int-elasticrun-host"
    project_id     = "prod-int-elasticrun-host"
    project_folder = "folders/1081601249902"
    labels = {
      environment = "production"
      owner       = "manoj"
      department  = "elasticrun"
      customer    = "manoj"
      businessunit = "internal"
         
    }
  }
}
# Creation of budget notification channel  from the tfvars 
```hcl
module "budget_notification_channel" {
  for_each   = toset(local.project_ids)
  source     = "../../../modules/terraform-google-budget/monitoring_notification_channel"
  notification_display_name = "Notification channel for ${each.key}"
  notification_type = var.notification_type
  notification_project = each.key
  email_address = var.email_address
}
```
#budget alert details
amount                  = 50000
notification_type       = "email"
notification_email      = "manoj.thangaraj@elastic.run" 
notification_project_id = "prj-cmn-int-elasticrun5a"
thresholds = [
   {
    percentage = 0.5,
    basis      = "FORECASTED_SPEND"
  },

  {
    percentage = 0.75,
    basis      = "CURRENT_SPEND"
  },

  {
    percentage = 0.9
    basis      = "CURRENT_SPEND"
  },
  
]
