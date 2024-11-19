# Variable for the Level-1 main folder(s) (e.g., elastic-run)
variable "main_folders_1" {
  description = "List of top-level main folders"
  type        = list(string)
}

# Variable for Level-2 folders inside each Level-1 main folder
variable "main_folders_2" {
  description = "Map of Level-2 folders within each Level-1 main folder. Key is folder name, value is a list of Level-2 folders."
  type        = map(list(string))
}

# Variable for Level-3 subfolders inside each Level-2 folder
variable "sub_folders" {
  description = "Map of Level-3 subfolders within each Level-2 folder. Key is Level-2 folder name, value is a list of subfolder names."
  type        = map(list(string))
}

# Variable for specifying the type of the parent resource (e.g., organization or folder)
variable "parent_type" {
  description = "Type of the parent resource, typically 'organizations' or 'folders'."
  type        = string
}

# Variable for specifying the ID of the parent resource
variable "parent_id" {
  description = "ID of the parent resource under which the Level-1 folders will be created."
  type        = string
}
