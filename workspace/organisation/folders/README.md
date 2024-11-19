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

Basic usage of this module is as follows:

```hcl
module "ou_folders" {
    providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source = "../../../modules/terraform-google-folders"
  parent = format("%s/%s", var.parent_type, var.parent_id)
  names  = var.ou_folders
}


module "org_policy_env" {
  for_each  = { for x in local.dev : x.parent_name => x }
  source    = "./dev_policy"
  folder_id = module.bu_folders[each.value.parent_name].ids[each.value.sub_folder_name[0]]
}

#Module for creation lavel-2 folders
module "prod_folders" {
    providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  for_each   = toset(var.prod_folders)
  source     = "../../../modules/terraform-google-folders"
  parent     = module.ou_folders.ids[each.value]
  names      = ["${each.value}-prod"]
  depends_on = [module.ou_folders]
}

#Module for creation lavel-2 folders
module "non_prod_folders" {
    providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  for_each   = toset(var.non_prod_folders)
  source     = "../../../modules/terraform-google-folders"
  parent     = module.ou_folders.ids[each.value]
  names      = ["${each.value}-nonprod"]
  depends_on = [module.ou_folders]
}

```
## Creation of folder from tfvars
```hcl
#Variable assignment for level 1 folder creation 
## All folder names
ou_folders = [
  "wiai-agri",
  "wiai-edu",
  "wiai-tb",
  "wiai-health",
  "wiai-mnch",
  "wiai-demos",
  "wiai-statesai",
  "wiai-shared",
  "wiai-common-services"

]
## Folder which contain prod folder
prod_folders = [
  "wiai-agri",
  "wiai-edu",
  "wiai-tb",
  "wiai-health",
  "wiai-mnch",
  "wiai-demos",
  "wiai-statesai",
  "wiai-shared",
]
## Folder which contain non-prod folder
non_prod_folders = [
  "wiai-agri",
  "wiai-edu",
  "wiai-tb",
  "wiai-health",
  "wiai-mnch",
  "wiai-statesai",
  "wiai-shared",
]
```
Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env_folders | Folder names without sub folder and policy attached  | `list(string)` | `[]` | no |
| bu_list | Folder names with sub folder and policy attached  | `list(string)` | `[]` | no |
| parent_id | The resource id of the parent Folder or Organization.| `string` | n/a | yes |
| parent_type | The resource type of the parent Folder or Organization.| `string` | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Folder Creator: `roles/resourcemanager.folderCreator`

