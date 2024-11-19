# project = {
#   name            = "opensourcetools-poc",
#   service_account = "terraform-service-account-01@opensourcetools-poc.iam.gserviceaccount.com"
# }


#organization details
parent_id   = "173522509326" # change to organization id currently its folder id
parent_type = "organizations"


# Level-1 main folders
main_folders_1 = ["elastic-run",]

# Level-2 folders inside each Level-1 main folder
main_folders_2 = {
  internal = ["internal"]
  common   = ["customer"]
}

# Level-3 subfolders inside each Level-2 folder
sub_folders = {
  internal = ["staging", "production", "common-services"]
  common   = ["staging", "production", "common-services"]
}



