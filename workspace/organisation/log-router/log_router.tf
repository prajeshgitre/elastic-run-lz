data "google_folder" "folders" {
  provider            = google.project
  for_each            = toset(var.log_folders)
  folder              = "folders/${each.key}"
  lookup_organization = true
}

module "log_router" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                 = "../../../modules/terraform-google-log-export/"
  for_each               = toset(var.log_folders)
  destination_uri        = "storage.googleapis.com/bkt-common-service-asso2-logging-${data.google_folder.folders["${each.key}"].display_name}"
  filter                 = var.log_filter
  log_sink_name          = "log-router-common-service-${data.google_folder.folders["${each.key}"].display_name}"
  parent_resource_id     = each.key
  parent_resource_type   = "folder"
  unique_writer_identity = true
  include_children       = true
  depends_on             = [module.destination]
}

module "destination" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source           = "../../../modules/terraform-google-storage/"
  for_each         = toset(var.log_folders)
  name             = "bkt-common-service-asso2-logging-${data.google_folder.folders["${each.key}"].display_name}"
  versioning       = false
  project_id       = var.bucket_project
  location         = var.bucket_location
  retention_policy = var.retention_policy
  lifecycle_rules  = var.lifecycle_rules
  labels = var.labels
}

resource "google_storage_bucket_iam_member" "storage_sink_member" {
  provider   = google.project
  for_each   = toset(var.log_folders)
  bucket     = "bkt-common-service-asso2-logging-${data.google_folder.folders["${each.key}"].display_name}"
  role       = "roles/storage.legacyBucketWriter"
  member     = module.log_router[each.key].writer_identity
  depends_on = [module.destination]
}