# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }

vpc_list = {
  vpc-prod-wiai-asso1-primary = {
    shared_vpc_name                        = ""
    project_id                             = "wiai-prod-host-vpc-68"
    delete_default_internet_gateway_routes = false
    subnets = [
      {
        subnet_name           = "subnet-prod-tlib-asso1-regular"
        subnet_ip             = "10.200.0.0/24"
        subnet_region         = "asia-south1"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "regular subnet for project wiai-tbet-tlib-nonprod"
      },


    ]
    secondary_ranges = {
      subnet-prod-orf-asso1-gke-backend = [
        {
          ip_cidr_range = "10.208.32.0/20"
          range_name    = "subnet-prod-orf-asso1-gke-pod-backend"
        },
        {
          ip_cidr_range = "10.208.22.0/26"
          range_name    = "subnet-prod-orf-asso1-gke-svc-backend"
        },
      ],



      subnet-prod-tlib-asso1-gke-tfy = [
        {
          ip_cidr_range = "10.200.6.0/23"
          range_name    = "subnet-prod-tlib-asso1-gke-pod-tfy"
        },
        {
          ip_cidr_range = "10.200.3.0/24"
          range_name    = "subnet-prod-tlib-asso1-gke-svc-tfy"
        },
      ],

      subnet-prod-opht-asso1-gke-tfy = [
        {
          ip_cidr_range = "10.220.14.0/23"
          range_name    = "subnet-prod-opht-asso1-gke-pod-tfy"
        },
        {
          ip_cidr_range = "10.220.11.0/24"
          range_name    = "subnet-prod-opht-asso1-gke-svc-tfy"
        },
      ],



    },
  },
}

// Shared VPC Attachment Details
host_project_id     = "wiai-prod-host-vpc-68"
host_subnet_regions = ["asia-south1"]

service_project_ids = ["wiai-agri-grn-prod-srv-77", ]

host_subnets = ["subnet-prod-grn-asso1-01",]

host_subnet_users = {
  subnet-prod-ews-asso1-01                = "",


}

firewall_rules_list = {
  fw-prod-asso1-deny-all = {
    network_name = "vpc-prod-wiai-asso1-primary"
    project_id   = "wiai-prod-host-vpc-68"
    rules = [
      {
        name                    = "fw-prod-asso1-deny-ingress"
        priority                = 10000
        description             = "deny all ingress traffic"
        direction               = "INGRESS"
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny = [{
          protocol = "all"
          ports    = []
          }
        ]
        allow = []
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
      },
 


    ]
  },
  fw-nonprod-asso1-twingate-connector-to-all = {
    network_name = "vpc-prod-wiai-asso1-primary"
    project_id   = "wiai-prod-host-vpc-68"
    rules = [
      {
        name                    = "fw-prod-asso1-twingate-connector-to-all"
        priority                = 7000
        description             = "fw-prod-twingate to all instance"
        direction               = "INGRESS"
        ranges                  = []
        source_tags             = ["twingate-connector"]
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny                    = []
        allow = [{
          protocol = "all"
          ports    = []
          }
        ]
        deny = []
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
      },

    ]

  },




}

dns_network    = "vpc-prod-wiai-asso1-primary"
dns_project_id = "wiai-prod-host-vpc-68"
cloud_dns = [
  {
    type   = "private"
    name   = "accounts-google-com"
    domain = "accounts.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.accounts.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "appengine-google-com"
    domain = "appengine.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.appengine.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "appspot-com"
    domain = "appspot.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.appspot.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "cloudfunctions-net"
    domain = "cloudfunctions.net."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.cloudfunctions.net.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "cloudproxy-app"
    domain = "cloudproxy.app."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.cloudproxy.app.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "composer-cloud-google-com"
    domain = "composer.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.composer.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "composer-googleusercontent-com"
    domain = "composer.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.composer.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "datafusion-cloud-google-com"
    domain = "datafusion.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.datafusion.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "datafusion-googleusercontent-com"
    domain = "datafusion.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.datafusion.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dataproc-cloud-google-com"
    domain = "dataproc.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dataproc.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dataproc-googleusercontent-com"
    domain = "dataproc.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dataproc.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dl-google-com"
    domain = "dl.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dl.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "gcr-io"
    domain = "gcr.io."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.gcr.io.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "googleadapis-com"
    domain = "googleadapis.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.googleadapis.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "googleapis-com"
    domain = "googleapis.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.googleapis.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "gstatic-com"
    domain = "gstatic.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.gstatic.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "ltsapis-goog"
    domain = "ltsapis.goog."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.ltsapis.goog.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "notebooks-cloud-google-com"
    domain = "notebooks.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.notebooks.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "notebooks-googleusercontent-com"
    domain = "notebooks.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.notebooks.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "backupdr-cloud-google-com"
    domain = "backupdr.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.backupdr.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "backupdr-googleusercontent-com"
    domain = "backupdr.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.backupdr.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "packages-cloud-google-com"
    domain = "packages.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.packages.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "pkg-dev"
    domain = "pkg.dev."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.pkg.dev.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "pki-goog"
    domain = "pki.goog."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.pki.goog.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "run-app"
    domain = "run.app."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.run.app.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "source-developers-google-com"
    domain = "source.developers.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.source.developers.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  # {
  #   type   = "private"
  #   name   = "nugetpackages-myfarebox-com"
  #   domain = "nugetpackages.myfarebox.com."
  #   recordsets = [
  #     {
  #       name = ""
  #       type = "A"
  #       ttl  = 300
  #       records = [
  #         "10.200.4.192"
  #       ]
  #     },
  #   ]
  # },


]

reserve_static_ip = [
  {
    name         = "sip-prod-static-nat-ip-01"
    project_id   = "wiai-prod-host-vpc-68"
    region       = "asia-south1"
    address_type = "EXTERNAL"

  },
  {
    name         = "sip-prod-static-nat-ip-02"
    project_id   = "wiai-prod-host-vpc-68"
    region       = "asia-south1"
    address_type = "EXTERNAL"
  },


]

cloud_nat = [
  {
    project_id                          = "wiai-prod-host-vpc-68"
    router_network                      = "vpc-prod-wiai-asso1-primary"
    region                              = "asia-south1"
    nat_name                            = "nat-prod-asso1-gateway-01"
    router_name                         = "router-prod-asso1-nat-01"
    create_router                       = true
    log_config_enable                   = true
    log_config_filter                   = "ALL"
    enable_dynamic_port_allocation      = true
    enable_endpoint_independent_mapping = false
    min_ports_per_vm                    = 256
    static_ip_name                      = ["sip-prod-static-nat-ip-01", "sip-prod-static-nat-ip-02"]
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    subnetworks                         = []
    nat_rules                           = []
  },
]

# private service connection
private_service_access = {
  private_service_access1 = {
    address  = "10.209.2.0"
    vpc_name = "vpc-prod-wiai-asso1-primary"
    name     = "subnet-psc-prod-ews-asso1-01"
  },



}
