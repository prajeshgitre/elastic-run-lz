# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }



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

