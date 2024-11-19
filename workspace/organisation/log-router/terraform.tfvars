# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }

# Organization ID
parent_id   = "132425377817"

# OU Folders List
log_folders = [
  297087902140, 
  575561349669, 
  1042239191963, 
  1054999797765, 
]

# Log sink bucket details 
bucket_project = "common-service-f0"
bucket_location = "asia-south1"

log_filter     = "log_id(\"cloudaudit.googleapis.com/activity\") OR log_id(\"cloudaudit.googleapis.com/policy\") OR log_id(\"cloudaudit.googleapis.com/data_access\") OR log_id(\"cloudaudit.googleapis.com/access_transparency\") OR log_id(\"dns.googleapis.com/dns_queries\") OR (log_id(\"compute.googleapis.com/nat_flows\") AND resource.type=\"nat_gateway\") OR (log_id(\"compute.googleapis.com/firewall\") AND resource.type=\"gce_subnetwork\") OR (log_id(\"compute.googleapis.com/vpc_flows\") AND resource.type=\"gce_subnetwork\") OR ((log_id(\"ids.googleapis.com/threat\") OR log_id(\"ids.googleapis.com/traffic\")) AND resource.type=\"ids.googleapis.com/Endpoint\") OR (log_id(\"requests\") AND resource.type=\"http_load_balancer\") OR (log_id(\"syslog\") AND resource.type=\"gce_instance\") OR ((log_id(\"winevt.raw\") OR log_id(\"windows_event_log\")) AND resource.type=\"gce_instance\") OR log_id(\"resource.type=gce\") OR log_id(\"resource.type=gcs_bucket\") OR log_id(\"resource.type=cloudsql_database\") OR log_id(\"resource.type=bigquery_resource\")"

labels = {
  "owner_email": "pankaj-wadhwaniai-org",
}

retention_policy = {
  retention_period = 2592000
  is_locked        = true
}

lifecycle_rules = [{
  action = {
    storage_class = "COLDLINE"
    type          = "SetStorageClass"
  }
  condition = {
    age = "30",
    matches_prefix=["compute.googleapis.com","syslog"]
  }
},
{
 action = {
    type          = "Delete"
  }
  condition = {
    age = "90",
    matches_prefix=["compute.googleapis.com","syslog"]
  }
},
{
  action = {
    storage_class = "COLDLINE"
    type          = "SetStorageClass"
  }
  condition = {
    age = "90",
    matches_prefix=["cloudaudit.googleapis.com"]
  }
},
{
 action = {
    type          = "Delete"
  }
  condition = {
    age = "360",
    matches_prefix=["cloudaudit.googleapis.com"]
  }
}]
