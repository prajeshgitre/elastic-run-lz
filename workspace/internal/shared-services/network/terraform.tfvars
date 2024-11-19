project = {
  name            = "wiai-bootstrap-seed",
  service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
}

#Cloud vpc
vpc_list = {
  vpc-common-service-wiai-asso1-primary = {
    vpc_name                               = "vpc-common-service-wiai-asso1-primary"
    project_id                             = "wiai-common-service-f0"
    delete_default_internet_gateway_routes = false
    subnets = [
      {
        subnet_name           = "subnet-common-service-asso1-01"
        subnet_ip             = "10.100.0.0/24"
        subnet_region         = "asia-south1"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "subnet for common service"
      },
    ]
      secondary_ranges = {

      }
  
  },
}

firewall_rules_list = {
    fw-common-asso1-deny-all = {
    network_name = "vpc-common-service-wiai-asso1-primary"
    project_id   = "wiai-common-service-f0"
    rules = [
      {
        name                    = "fw-common-asso1-deny-ingress"
        priority                = 10000
        description             = "deny all ingress traffic"
        direction               = "INGRESS"
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny  = [{
          protocol="all"
          ports = []
        }
        ]              
        allow = []
        log_config              = {
            metadata = "EXCLUDE_ALL_METADATA"
        }
      },
      {
        name                    = "fw-common-asso1-deny-egress"
        priority                = 10000
        description             = "deny all egress traffic"
        direction               = "EGRESS"
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny  = [{
          protocol="all"
          ports = []
        }
        ]            
        allow = []
        log_config              = {
            metadata = "EXCLUDE_ALL_METADATA"
        }
      },
      {
        name                    = "fw-common-asso1-allow-nat-egress"
        priority                = 8000
        description             = "all nat ingress traffic"
        direction               = "EGRESS"
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["nat"]
        target_service_accounts = null
        log_config              = null
        deny  = []              
        allow = [{
          protocol= "all"
          ports = []
        }
        ]
        log_config              = {
            metadata = "EXCLUDE_ALL_METADATA"
        }
      },  
      {
        name                    = "fw-common-asso1-allow-iap-ingress"
        priority                = 8000
        description             = "all iap ingress traffic"
        direction               = "INGRESS"
        ranges                  = ["35.235.240.0/20"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["ssh","rdp"]
        target_service_accounts = null
        log_config              = null
        deny  = []              
        allow = [{
          protocol= "tcp"
          ports = ["3389","22","3306","1433","5432"]
        }
        ]
        log_config              = {
            metadata = "EXCLUDE_ALL_METADATA"
        }
      },
    ]
    },
      fw-common-quicksight-asso1-aws-to-gcp = {
    network_name = "vpc-common-service-wiai-asso1-primary"
    project_id   = "wiai-common-service-f0"
    rules = [
   {
        name                    = "fw-common-quicksight-asso1-aws-to-gcp"
        priority                = 1000
        description             = "quicksight"
        direction               = "INGRESS"
        ranges                  = ["150.0.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny                    = []
        allow = [{
          protocol = "all"
          ports    = []
        }]
         deny = []
      log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      } 
    ]
  },
  fw-common-asso1-hc-ingress = {
    network_name = "vpc-common-service-wiai-asso1-primary"
    project_id   = "wiai-common-service-f0"
    rules = [
   {
        name                    = "fw-common-asso1-hc-ingress"
        priority                = 8000
        description             = "allow health check"
        direction               = "INGRESS"
        ranges                  = ["35.191.0.0/16", "130.211.0.0/22"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = []
        target_service_accounts = null
        log_config              = null
        deny                    = []
        allow = [{
          protocol = "tcp"
          ports    = []
        }]
         deny = []
      log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      } 
    ]
  },
}

subnet_level_firewall_rules_list = {
    fw-common-asso1-intra-allow-ingress= {
      network_name = "vpc-common-service-wiai-asso1-primary"
      project_id   = "wiai-common-service-f0"
      rules = [{
      name                    = "fw-common-asso1-intra-allow-ingress"
      description             = null
      direction               = "INGRESS"
      priority                = 7000
      destination_ranges      = ["10.100.0.0/24"]
      source_ranges           = ["10.100.0.0/24"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol ="all"
        ports =[]
      }

      ]
      deny = []
     log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      
    }]
  },

  fw-common-asso1-intra-allow-egress = {
      network_name = "vpc-common-service-wiai-asso1-primary"
      project_id   = "wiai-common-service-f0"
      rules = [{
      name                    = "fw-common-asso1-intra-allow-egress"
      description             = null
      direction               = "EGRESS"
      priority                = 7000
      destination_ranges      = ["10.100.0.0/24"]
      source_ranges           = ["10.100.0.0/24"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol ="all"
        ports =[]
      }
      ]
      deny = []
      log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      
    }]
  },
  fw-common-asso1-cloudsql-allow-egress = {
      network_name = "vpc-common-service-wiai-asso1-primary"
      project_id   = "wiai-common-service-f0"
      rules = [{
      name                    = "fw-common-asso1-cloudsql-allow-egress"
      description             = null
      direction               = "EGRESS"
      priority                = 6000
      destination_ranges      = ["10.100.7.0/24"]
      source_ranges           = ["10.100.0.0/24"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol ="all"
        ports =[]
      }
      ]
      deny = []
      log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      
    }]
  },
    fw-common-asso1-intra-allow-egress = {
      network_name = "vpc-common-service-wiai-asso1-primary"
      project_id   = "wiai-common-service-f0"
      rules = [{
      name                    = "fw-common-asso1-intra-allow-egress"
      description             = null
      direction               = "EGRESS"
      priority                = 7000
      destination_ranges      = ["10.100.0.0/24"]
      source_ranges           = ["10.100.0.0/24"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol ="all"
        ports =[]
      }
      ]
      deny = []
      log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
      
    }]
  },
  }

private_service_access = {
  private_service_access1 = {
    address  = "10.100.7.0"
    vpc_name = "vpc-common-service-wiai-asso1-primary"
    name     = "subnet-psc-common-asso1-01"
  },
}

reserve_static_ip = [
  {
    name         = "sip-common-static-nat-ip-01"
    project_id   = "wiai-common-service-f0"
    region       = "asia-south1"
    address_type = "EXTERNAL"
  },
]

cloud_nat = [
  {
    project_id                          = "wiai-common-service-f0"
    router_network                      = "vpc-common-service-wiai-asso1-primary"
    region                              = "asia-south1"
    nat_name                            = "nat-common-asso1-gateway-01"
    router_name                         = "router-common-asso1-nat-01"
    create_router                       = true
    log_config_enable                   = false
    log_config_filter                   = "ALL"
    enable_dynamic_port_allocation      = true
    enable_endpoint_independent_mapping = false
    min_ports_per_vm                    = 2048
    //static address should be declared in above static_ip_name variable
    static_ip_name                      = ["sip-common-static-nat-ip-01"]
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    // "LIST_OF_SUBNETWORKS"
    subnetworks = [
    ]
  },
]

#VPC peering 

vpc_peering_list = {
  vpc-peer-common-service-to-nonprod-01 = {
    local_project_id = "wiai-common-service-f0"
    local_network    = "vpc-common-service-wiai-asso1-primary"
    peer_project_id  = "wiai-nonprod-host-vpc-33"
    peer_network     = "vpc-nonprod-wiai-asso1-primary"
  },
  vpc-peer-common-service-to-prod-01 = {
    local_project_id = "wiai-common-service-f0"
    local_network    = "vpc-common-service-wiai-asso1-primary"
    peer_project_id  = "wiai-prod-host-vpc-68"
    peer_network     = "vpc-prod-wiai-asso1-primary"
  },
}

# #cloud dns
dns_network    = "vpc-common-service-wiai-asso1-primary"
dns_project_id = "wiai-common-service-f0"
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
  {
    type   = "private"
    name   = "sql-prod-common-db-email-internal"
    domain = "sql-prod-common-db.email.internal."
    recordsets = [
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "10.100.7.9"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "sql-prod-common-db-serveflow-internal"
    domain = "sql-prod-common-db.serveflow.internal."
    recordsets = [
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "10.100.7.5"
        ]
      },
    ]
  },
]

