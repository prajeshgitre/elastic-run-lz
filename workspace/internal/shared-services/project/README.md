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
}

project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}


// billing account id
billing_account = "01C4D7-B0D936-B27FBF"


# Details of projects
projects_list = {
  proj1 = {
    prefix         = "prj"
    project_name   = "cmn-int-elasticrun"
    project_id     = "cmn-int-elasticrun"
    project_folder = "folders/1081601249902"
    labels = {
      environment = "common-service"
      owner       = "manoj"
      department  = "elasticrun"
      customer    = "manoj"
      businessunit = "internal"

    }
  }
}

 # budget alert details
amount                  = 50000
notification_type       = "email"
notification_email      = "manoj.thangaraj@elastic.run" 
notification_project_id = "prj-cmn-int-elasticrun5a"
thresholds = [{
  percentage = 0.5,
  basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.75,
    basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.9,
    basis      = "CURRENT_SPEND"
  },

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

