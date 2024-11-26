# The type of the parent resource (either "organizations" or "folders")
variable "parent_type" {
  description = "The type of the parent resource (organizations or folders)"
  type        = string
  default     = "folders"  
}

# The resource ID of the parent Folder or Organization
variable "parent_id" {
  description = "The resource ID of the parent Folder or Organization"
  type        = string
}

# Main folders to create
variable "main_folders" {
  description = "A map of main folders and their subfolders"
  type        = map(list(string))
}

# Subfolders inside each main folder
variable "sub_folders" {
  description = "A map of subfolders for each main folder"
  type        = map(list(string))
}
