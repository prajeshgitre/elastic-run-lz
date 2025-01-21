project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform-org@prj-seed-elasticrun.iam.gserviceaccount.com"
}
parent_id = "1098389060758"
org-policy = [
  {
    constraint        = "constraints/iam.workloadIdentityPoolAwsAccounts"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.workloadIdentityPoolProviders"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.serviceAccountKeyExpiryHours"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["1h"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.serviceAccountKeyExposureResponse"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["DISABLE_KEY"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/iam.disableWorkloadIdentityClusterCreation"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/meshconfig.allowedVpcscModes"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/cloudfunctions.allowedIngressSettings"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["ALLOW_INTERNAL_ONLY"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/run.allowedIngress"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["internal-and-cloud-load-balancing"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/cloudfunctions.allowedVpcConnectorEgressSettings"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["ALL_TRAFFIC"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/compute.disableSerialPortLogging"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = false
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/run.allowedVPCEgress"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["all-traffic"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/cloudfunctions.restrictAllowedGenerations"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["1stGen", "2ndGen"]
    deny              = []
    allow_list_length = 2
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.disablePrivateServiceConnectCreationForConsumers	 "
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/compute.vmExternalIpAccess"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/compute.disableGlobalSerialPortAccess"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/compute.disableNonFIPSMachineTypes"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  {
    constraint        = "constraints/compute.requireSslPolicy"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictCrossProjectServices"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictPrivateServiceConnectConsumer"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictPrivateServiceConnectProducer"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.requireBasicQuotaInResponse"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.requireOsConfig"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.setNewProjectDefaultToZonalDNSOnly"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/iam.allowServiceAccountCredentialLifetimeExtension"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/iam.allowedPolicyMemberDomains"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableAllIpv6"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/iam.disableAuditLoggingExemption"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/iam.disableServiceAccountCreation"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableHybridCloudIpv6"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableGlobalCloudArmorPolicy"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableGlobalSelfManagedSslCertificate"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/iap.requireGlobalIapWebDisabled"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableGlobalLoadBalancing"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableGuestAttributesAccess"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/iap.requireRegionalIapWebDisabled"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/commerceorggovernance.marketplaceServices"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = ["PRIVATE_MARKETPLACE"]
  #   deny              = []
  #   allow_list_length = 1
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/commerceorggovernance.disablePublicMarketplace"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableInternetNetworkEndpointGroup"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/iam.disableServiceAccountKeyCreation"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/iam.disableServiceAccountKeyUpload"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/appengine.disableCodeDownload"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/appengine.runtimeDeploymentExemption"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/compute.disableSshInBrowser"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/resourcemanager.accessBoundaries"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/cloudkms.allowedProtectionLevels"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #    organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/gcp.restrictCmekCryptoKeyProjects"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/gcp.restrictNonCmekServices"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/cloudkms.minimumDestroyScheduledDuration"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = ["in:30d"]
  #   deny              = []
  #   allow_list_length = 1
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  {
    constraint        = "constraints/cloudkms.disableBeforeDestroy"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/compute.disableNestedVirtualization"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/compute.disableSerialPortAccess"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.disableVpcExternalIpv6"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.disableVpcInternalIpv6"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.requireVpcFlowLogs"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/storage.publicAccessPrevention"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/storage.restrictAuthTypes"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/storage.retentionPolicySeconds"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/storage.uniformBucketLevelAccess"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/gcp.detailedAuditLoggingMode"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/gcp.disableCloudLogging"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/gcp.resourceLocations"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = ["in:asia-south1-locations", "in:asia-east1-locations", "in:us-central1-locations", "in:asia-south2-locations"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.requireOsLogin"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  {
    constraint        = "constraints/compute.requireShieldedVm"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/compute.restrictNonConfidentialComputing"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/gcp.restrictServiceUsage"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/resourcemanager.allowEnabledServicesForExport"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/resourcemanager.allowedExportDestinations"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/resourcemanager.allowedImportSources"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = ["all"]
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/serviceuser.services"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/essentialcontacts.disableProjectSecurityContacts"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/cloudscheduler.allowedTargetTypes"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/cloudfunctions.requireVPCConnector"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/compute.restrictDedicatedInterconnectUsage"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/compute.restrictPartnerInterconnectUsage"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.restrictProtocolForwardingCreationForTypes"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/run.allowedBinaryAuthorizationPolicies"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/storage.secureHttpTransport"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/storage.softDeletePolicySeconds"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/iam.restrictCrossProjectServiceAccountLienRemoval"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/compute.restrictSharedVpcHostProjects"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = ["prj-prod-svc-elasticrun-01-94"]
  },
  {
    constraint        = "constraints/compute.restrictSharedVpcSubnetworks"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictXpnProjectLienRemoval"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },
  # {
  #   constraint        = "constraints/compute.sharedReservationsOwnerProjects"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/compute.storageResourceUseRestrictions"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/compute.trustedImageProjects"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/compute.restrictVpcPeering"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = ["prj-cmn-int-elasticrun5a", "prj-prod-int-elasticrun-hostd1", "prj-prod-int-elasticrun-hostc9"]
  },

  {
    constraint        = "constraints/compute.restrictVpnPeerIPs"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = null
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  {
    constraint        = "constraints/compute.skipDefaultNetworkCreation"
    policy_type       = "boolean"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.restrictCloudNATUsage"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  # {
  #   constraint        = "constraints/compute.restrictLoadBalancerCreationForTypes"
  #   policy_type       = "list"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/compute.vmCanIpForward"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },

  {
    constraint        = "constraints/compute.restrictSharedVpcBackendServices"
    policy_type       = "list"
    policy_for        = "folder"
    organization_id   = null
    folder_id         = "1098389060758"
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/624022159581"]
    exclude_projects  = []
  },

  # {
  #   constraint        = "constraints/compute.allowedVlanAttachmentEncryption"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = []
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
  # {
  #   constraint        = "constraints/essentialcontacts.allowedContactDomains"
  #   policy_type       = "boolean"
  #   policy_for        = "folder"
  #   organization_id   = null
  #   folder_id         = "1098389060758"
  #   project_id        = null
  #   enforce           = true
  #   allow             = ["all"]
  #   deny              = []
  #   allow_list_length = 0
  #   exclude_folders   = ["folders/624022159581"]
  #   exclude_projects  = []
  # },
]