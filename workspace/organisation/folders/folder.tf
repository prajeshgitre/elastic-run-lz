module "main_folder" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source   = "../../../modules/terraform-google-folders"
  for_each = toset(keys(var.main_folders))

  parent = format("%s/%s", var.parent_type, var.parent_id)
  names  = var.main_folders[each.key]
}

# Module for creating Subfolders (Level-3 folders)
module "sub_folders" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source   = "../../../modules/terraform-google-folders"
  for_each = { for k, v in var.sub_folders : k => v if contains(keys(module.main_folder), k) }

  parent     = module.main_folder[each.key].id
  names      = each.value
  depends_on = [module.main_folder]
}