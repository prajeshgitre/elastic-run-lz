# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }

vpc_list = {
  vpc-nonprod-wiai-asso1-primary = {
    shared_vpc_name                        = "vpc-nonprod-wiai-asso1-primary"
    project_id                             = "wiai-nonprod-host-vpc-33"
    delete_default_internet_gateway_routes = false
    subnets = [                                    
     
      {
        subnet_name           = "subnet-nonprod-learn-asso1-01"
        subnet_ip             = "10.64.4.0/24"
        subnet_region         = "asia-south1"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "subnet for non-prod learn"
      }
    ]
  
    

    secondary_ranges = {
      subnet-nonprod-orf-asso1-gke-backend = [
        {
          ip_cidr_range = "10.64.32.0/20"
          range_name    = "subnet-nonprod-orf-asso1-gke-pod-backend"
        },
        {
          ip_cidr_range = "10.64.22.0/24"
          range_name    = "subnet-nonprod-orf-asso1-gke-svc-backend"
        },
     ],
   
    }
  }
}

firewall_rules_list = {
  fw-nonprod-asso1-deny-all = {
    network_name = "vpc-nonprod-wiai-asso1-primary"
    project_id   = "wiai-nonprod-host-vpc-33"
    rules = [
      {
        name                    = "fw-nonprod-asso1-deny-ingress"
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
          log_config              = {
        metadata = "EXCLUDE_ALL_METADATA"
      }           
        allow = []
      },
  #     {
  #       name                    = "fw-nonprod-asso1-deny-egress"
  #       priority                = 10000
  #       description             = "deny all egress traffic"
  #       direction               = "EGRESS"
  #       ranges                  = ["0.0.0.0/0"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = []
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = [{
  #         protocol="all"
  #         ports = []
  #       }
  #       ]       
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }       
  #       allow = []
  #     },
  #       {
  #       name                    = "fw-nonprod-asso1-allow-egress-swym-cloudsql-to-aws-rds"
  #       priority                = 7000
  #       description             = "deny all ingress traffic"
  #       direction               = "EGRESS"
  #       ranges                  = ["36.4.0.0/16"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = null
  #       target_service_accounts = ["p915141199183-qp1ffx@gcp-sa-cloud-sql.iam.gserviceaccount.com"]
  #       log_config              = null
  #       deny  = [ ]              
  #       allow = [{
  #         protocol="tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     },
  #     {
  #       name                    = "fw-nonprod-asso1-allow-ingress-aws-rds-to-sp-cloudsql"
  #       priority                = 7000
  #       description             = "deny all ingress traffic"
  #       direction               = "INGRESS"
  #       ranges                  = ["36.4.0.0/16"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = null
  #       target_service_accounts = ["p915141199183-qp1ffx@gcp-sa-cloud-sql.iam.gserviceaccount.com"]
  #       log_config              = null
  #          deny  = [ ]              
  #         allow = [{
  #         protocol="tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     },
  #    {
  #       name                    = "fw-nonprod-asso1-allow-nat-egress"
  #       priority                = 8000
  #       description             = "all nat ingress traffic"
  #       direction               = "EGRESS"
  #       ranges                  = ["0.0.0.0/0"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = ["nat"]
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = []              
  #       allow = [{
  #         protocol= "all"
  #         ports = []
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     },  
  #       {
  #       name                    = "fw-nonprod-asso1-allow-iap-ingress"
  #       priority                = 8000
  #       description             = "all iap ingress traffic"
  #       direction               = "INGRESS"
  #       ranges                  = ["35.235.240.0/20"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = ["ssh","rdp"]
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = []              
  #       allow = [{
  #         protocol= "tcp"
  #         ports = ["3389","22","3306","1433","5432","5433"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     }, 
  

             
  #      {
  #       name                    = "fw-nonprod-asso1-allow-app-to-db"
  #       priority                = 7000
  #       description             = "fw-swym-vm-to-db"
  #       direction               = "EGRESS"
  #       ranges                  = ["10.64.10.0/24"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = ["swym-nonprod-app"]
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = []              
  #       allow = [{
  #         protocol= "tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     }, 
  #   ]
  # }
  
  #  fw-nonprod-anthro-asso1-allow-app-to-db = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #     {
  #       name                    = "fw-nonprod-anthro-asso1-allow-app-to-db"
  #       priority                = 7000
  #       description             = "fw-anthro-vm-to-db"
  #       direction               = "EGRESS"
  #       ranges                  = ["10.60.10.0/24"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = ["anth-nonprod"]
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = []              
  #       allow = [{
  #         protocol= "tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     }, 
      
  #   ] 
  # },
  
  # fw-nonprod-swym-asso1-cloudsql-to-aws-rds = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #     {
  #       name                    = "fw-nonprod-swym-asso1-cloudsql-to-aws-rds"
  #       priority                = 7000
  #       description             = "deny all ingress traffic"
  #       direction               = "EGRESS"
  #       ranges                  = ["36.4.0.0/16"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = null
  #       target_service_accounts = ["p915141199183-qp1ffx@gcp-sa-cloud-sql.iam.gserviceaccount.com"]
  #       log_config              = null
  #       deny  = [ ]              
  #       allow = [{
  #         protocol="tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     },
      
  #   ] 
  # },
  # fw-nonprod-swym-asso1-cloudsql-to-aws-rds = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #   {
  #       name                    = "fw-nonprod-swym-asso1-cloudsql-to-aws-rds"
  #       priority                = 7000
  #       description             = "deny all ingress traffic"
  #       direction               = "INGRESS"
  #       ranges                  = ["36.4.0.0/16"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = null
  #       target_service_accounts = ["p915141199183-qp1ffx@gcp-sa-cloud-sql.iam.gserviceaccount.com"]
  #       log_config              = null
  #          deny  = [ ]              
  #         allow = [{
  #         protocol="tcp"
  #         ports = ["3306"]
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     },
      
  #   ] 
  # },
  #   fw-nonprod-asso1-twingate-connector-to-all = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #     {
  #       name                    = "fw-nonprod-asso1-twingate-connector-to-all"
  #       priority                = 7000
  #       description             = "fw-nonprod-twingate to all instance"
  #       direction               = "INGRESS"
  #       ranges                  = []
  #       source_tags             = ["twingate-connector"]
  #       source_service_accounts = null
  #       target_tags             = []
  #       target_service_accounts = null
  #       log_config              = null
  #       deny  = []              
  #       allow = [{
  #         protocol= "all"
  #         ports = []
  #       }
  #       ]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     }, 
  #   ] 
  # },
  #  fw-prod-asso1-hc-ingress-01 = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #  {
  #       name                    = "fw-nonprod-asso1-hc-ingress-01"
  #       priority                = 8000
  #       description             = "allow health check"
  #       direction               = "INGRESS"
  #       ranges                  = ["35.191.0.0/16", "130.211.0.0/22"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = []
  #       target_service_accounts = null
  #       log_config              = null
  #       deny                    = []
  #       allow = [{
  #         protocol = "tcp"
  #         ports    = []
  #       }]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     } 
  #   ]
  # },
  #   fw-nonprod-catb-asso1-sqlproxy-allow-egress = {
  #   network_name = "vpc-nonprod-wiai-asso1-primary"
  #   project_id   = "wiai-nonprod-host-vpc-33"
  #   rules = [
  #  {
  #       name                    = "fw-nonprod-catb-asso1-sqlproxy-allow-egress"
  #       priority                = 7000
  #       description             = "allow egress"
  #       direction               = "EGRESS"
  #       ranges                  = ["10.56.2.0/24"]
  #       source_tags             = null
  #       source_service_accounts = null
  #       target_tags             = ["sql-proxy"]
  #       target_service_accounts = null
  #       log_config              = null
  #       deny                    = []
  #       allow = [{
  #         protocol = "tcp"
  #         ports    = []
  #       }]
  #         log_config              = {
  #       metadata = "EXCLUDE_ALL_METADATA"
  #     }
  #     } 
    ]
  },
  
  
}

dns_network    = "vpc-nonprod-wiai-asso1-primary"
dns_project_id = "wiai-nonprod-host-vpc-33"
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
    name         = "sip-nonprod-static-nat-ip-01"
    project_id   = "wiai-nonprod-host-vpc-33"
    region       = "asia-south1"
    address_type = "EXTERNAL"

  },


]

cloud_nat = [
  {
    project_id                          = "wiai-nonprod-host-vpc-33"
    router_network                      = "vpc-nonprod-wiai-asso1-primary"
    region                              = "asia-south1"
    nat_name                            = "nat-nonprod-asso1-gateway-01"
    router_name                         = "router-nonprod-asso1-nat-01"
    create_router                       = true
    log_config_enable                   = false
    log_config_filter                   = "ALL"
    enable_dynamic_port_allocation      = true
    enable_endpoint_independent_mapping = false
    min_ports_per_vm                    = 2048
    //static address should be declared in above static_ip_name variable
    static_ip_name                      = ["sip-nonprod-static-nat-ip-01","sip-nonprod-static-nat-ip-02","sip-nonprod-static-nat-ip-03"]
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    // "LIST_OF_SUBNETWORKS"
    subnetworks = [
    ]
  },
]

# private service connection
private_service_access = {
  private_service_access1 = {
    address  = "10.64.10.0"
    vpc_name = "vpc-nonprod-wiai-asso1-primary"
    name     = "subnet-psc-nonprod-swayamprabha-asso1-01"
  },

}

// Shared VPC Attachment Details
host_project_id     = "-host-vpc-33"
host_subnet_regions = ["asia-south1"]

service_project_ids = ["nonprod-srv-5f",]

host_subnet_users = {
  subnet-nonprod-asso1-01 = "",

}
