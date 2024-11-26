# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }

vpc_list = {
  vpc-prod-wiai-asso1-primary = {
    shared_vpc_name                        = "vpc-prod-wiai-asso1-primary"
    project_id                             = "wiai-prod-host-vpc-68"
    delete_default_internet_gateway_routes = false
    subnets = [
      {
        subnet_name           = ""
        subnet_ip             = "10.200.0.0/24"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = ""
      },


    ]
    secondary_ranges = {
      subnet-prod-asso1-gke-backend = [
        {
          ip_cidr_range = "10.208.32.0/20"
          range_name    = "subnet-prod-asso2-gke-pod-backend"
        },
        {
          ip_cidr_range = "10.208.22.0/26"
          range_name    = "subnet-prod-asso2-gke-svc-backend"
        },
      ],



   

   



    },
  },
}

// Shared VPC Attachment Details
host_project_id     = "prj-prod-int-elasticrun-host"
host_subnet_regions = ["asia-south2"]

service_project_ids = ["prj-agri-grn-prod-srv-77", ]

host_subnets = ["subnet-prod-grn-asso1-01",]

host_subnet_users = {
  subnet-prod-ews-asso1-01                = "",


}

firewall_rules_list = {
  fw-prod-asso1-deny-all = {
    network_name = ""
    project_id   = ""
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
  }

    
  }
  

reserve_static_ip = [
  {
    name         = "sip-prod-static-nat-ip-01"
    project_id   = "wiai-prod-host-vpc-68"
    region       = "asia-south1"
    address_type = "EXTERNAL"

  },
  


]

cloud_nat = [
  {
    project_id                          = "prj-prod-int-elasticrun-host"
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
    static_ip_name                      = ["sip-prod-static-nat-ip-01"]
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
