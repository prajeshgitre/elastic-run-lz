project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}


vpc_list = {
  vpc-elasticrun-prod-as2-shared = {
    shared_vpc_name                        = "vpc-elasticrun-prod-as2-shared"
    project_id                             = "prj-prod-int-elasticrun-hostc9"
    delete_default_internet_gateway_routes = false
    subnets = [
      {
        subnet_name           = "sb-prod-as2-db"
        subnet_ip             = "172.20.26.0/24"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "db subnet"
      },
      {
        subnet_name           = "sb-prod-as2-k8s-app-01"
        subnet_ip             = "172.20.16.0/22"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "gke subnet"
      },
      # {
      #   subnet_name           = "sb-prod-as2-k8s-app-cp"
      #   subnet_ip             = "172.20.24.0/28"
      #   subnet_region         = "asia-south2"
      #   subnet_private_access = "true"
      #   subnet_flow_logs      = "true"
      #   description           = "gke control plane "
      # },
      {
        subnet_name           = "sb-prod-as2-k8s-eng-01"
        subnet_ip             = "172.20.28.0/22"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "gke eng subnet "
      },
      # {
      #   subnet_name           = "sb-prod-as2-k8s-eng-cp"
      #   subnet_ip             = "172.20.52.0/28"
      #   subnet_region         = "asia-south2"
      #   subnet_private_access = "true"
      #   subnet_flow_logs      = "true"
      #   description           = "gke control plan "
      # },


    ]
    secondary_ranges = {
      sb-prod-as2-k8s-app-01 = [
        {
          ip_cidr_range = "172.20.0.0/20"
          range_name    = "sb-prod-as2-k8-app-pod"
        },
        {
          ip_cidr_range = "172.20.20.0/22"
          range_name    = "sb-prod-as2-k8-app-svc"
        },
      ],
      sb-prod-as2-k8s-eng-01 = [
        {
          ip_cidr_range = "172.20.32.0/20"
          range_name    = "sb-prod-as2-k8s-eng-pod"
        },
        {
          ip_cidr_range = "172.20.48.0/22"
          range_name    = "sb-prod-as2-k8s-eng-svc"
        },
      ],

    },
  },
}

// Shared VPC Attachment Details
host_project_id     = "prj-prod-int-elasticrun-hostc9"
host_subnet_regions = ["asia-south2"]

service_project_ids = ["prj-prod-svc-elasticrun-01-94", ]

host_subnets = ["sb-prod-as2-db", "sb-prod-as2-k8s-app-01", "sb-prod-as2-k8s-eng-01", ]

host_subnet_users = {
  sb-prod-as2-k8s-app-01 = "",
  sb-prod-as2-db         = "",
  # sb-prod-as2-k8s-app-cp = "",
  sb-prod-as2-k8s-eng-01 = "",
  # sb-prod-as2-k8s-eng-cp = ""

}

firewall_rules_list = {
  fw-prod-asso1-deny-all = {
    network_name = "vpc-elasticrun-prod-as2-shared"
    project_id   = "prj-prod-int-elasticrun-hostc9"
    rules = [
      # {
      #   name                    = "fw-prod-asso1-deny-ingress"
      #   priority                = 10000
      #   description             = "deny all ingress traffic"
      #   direction               = "INGRESS"
      #   ranges                  = ["0.0.0.0/0"]
      #   source_tags             = null
      #   source_service_accounts = null
      #   target_tags             = []
      #   target_service_accounts = null
      #   log_config              = null
      #   deny = [{
      #     protocol = "all"
      #     ports    = []
      #     }
      #   ]
      #   allow = []
      #   log_config = {
      #     metadata = "EXCLUDE_ALL_METADATA"
      #   }
      # },

      {
        name                    = "fw-prod-ingress-allow-iap"
        priority                = 8000
        description             = "all nat ingress traffic"
        direction               = "INGRESS"
        ranges                  = ["35.235.240.0/20"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["ssh", "rdp"]
        target_service_accounts = null
        log_config              = null
        deny                    = []
        allow = [{
          protocol = "tcp"
          ports    = ["3389", "22"]
          }
        ]
        deny = []
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
      },

      {
        name                    = "fw-prod-ingress-allow-azure-gcp"
        priority                = 8000
        description             = "all nat ingress traffic"
        direction               = "INGRESS"
        ranges                  = ["10.210.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["ssh", "rdp"]
        target_service_accounts = null
        log_config              = null
        deny                    = []
        allow = {
          protocol = "icmp"
          ports = null
        }
        allow = [{
          protocol = "tcp"
          ports    = ["3389", "22"]
          }
        ]
        deny = []
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
      }
    ]
  }
}

reserve_static_ip = [
  {
    name         = "si-prod-shrd-as2-cloud-nat"
    project_id   = "prj-prod-int-elasticrun-hostc9"
    region       = "asia-south2"
    address_type = "EXTERNAL"

  },
]

cloud_nat = [
  {
    project_id                          = "prj-prod-int-elasticrun-hostc9"
    router_network                      = "vpc-elasticrun-prod-as2-shared"
    region                              = "asia-south2"
    nat_name                            = "cn-elasticrun-prod-as2-shrd-host-01"
    router_name                         = "si-prod-shrd-as2-cloud-nat"
    create_router                       = true
    log_config_enable                   = true
    log_config_filter                   = "ALL"
    enable_dynamic_port_allocation      = true
    enable_endpoint_independent_mapping = false
    min_ports_per_vm                    = 256
    static_ip_name                      = ["si-prod-shrd-as2-cloud-nat"]
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    subnetworks                         = []
    nat_rules                           = []
  },
]


