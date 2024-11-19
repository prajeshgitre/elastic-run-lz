project = {
  name            = "opensourcetools-poc",
  service_account = "terraform-service-account-01@opensourcetools-poc.iam.gserviceaccount.com"
}

parent_id = "211751838662"



org-policy = [
  {
    constraint        = "constraints/compute.vmExternalIpAccess"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all"]
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableServiceAccountCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = false
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableSerialPortLogging"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = false
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGlobalSerialPortAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/storage.uniformBucketLevelAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.skipDefaultNetworkCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/essentialcontacts.allowedContactDomains"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all"]
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.allowedPolicyMemberDomains"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["C03kz8xxxx"] #To be updated
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.setNewProjectDefaultToZonalDNSOnly"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all"]
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/compute.trustedImageProjects"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "211751838662"
  #   project_id        = null
  #   enforce           = null
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = []
  #   exclude_projects  = ["prj-vedanta-connectivity-hub"]
  # },
  {
    constraint        = "constraints/compute.vmCanIpForward"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["projects/prj-vedanta-connectivity-hub/zones/asia-south1-a/instances/vm-vedanta-ngfw-fg-01", "projects/prj-vedanta-connectivity-hub/zones/asia-south1-b/instances/vm-vedanta-ngfw-fg-02"]
    deny              = []
    allow_list_length = 2
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableServiceAccountKeyCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/appengine.disableCodeDownload"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableSerialPortAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictXpnProjectLienRemoval"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/gcp.resourceLocations"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["in:asia-south1-locations", "in:asia-east1-locations", "in:us-central1-locations"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = ["prj-vedanta-connectivity-hub"]
  },
  {
    constraint        = "constraints/cloudfunctions.allowedIngressSettings"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["ALLOW_INTERNAL_AND_GCLB"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/run.allowedIngress"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/cloudfunctions.allowedVpcConnectorEgressSettings"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/run.allowedVPCEgress"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all-traffic"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/resourcemanager.allowedExportDestinations"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.workloadIdentityPoolProviders"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.serviceAccountKeyExpiryHours"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["1h"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.serviceAccountKeyExposureResponse"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["DISABLE_KEY"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/cloudfunctions.requireVPCConnector"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableWorkloadIdentityClusterCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGlobalCloudArmorPolicy"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableServiceAccountKeyUpload"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableSshInBrowser"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableNestedVirtualization"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.requireOsLogin"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.requireShieldedVm"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = ["prj-vedanta-connectivity-hub"]
  },
  {
    constraint        = "constraints/iam.restrictCrossProjectServiceAccountLienRemoval"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = ""
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = []
    exclude_projects  = []
  },
]
