module "main_folder_1" {
  source   = "../../../modules/terraform-google-folders"
  for_each = toset(var.main_folders_1)

  parent = format("%s/%s", var.parent_type, var.parent_id)
  names  = [each.value]
}

# Module for creating Level-2 folders inside each Level-1 folder 
module "main_folder_2" {
  source   = "../../../modules/terraform-google-folders"
  for_each = toset(keys(var.main_folders_2))

  parent = module.main_folder_1[var.main_folders_1[0]].id
  names  = var.main_folders_2[each.key]
  depends_on = [module.main_folder_1]
}

# Module for creating Level-3 subfolders inside each Level-2 folder
module "sub_folders" {
  source   = "../../../modules/terraform-google-folders"
  for_each = { for k, v in var.sub_folders : k => v if contains(keys(module.main_folder_2), k) }

  parent = module.main_folder_2[each.key].id
  names  = each.value
  depends_on = [module.main_folder_2]
}
