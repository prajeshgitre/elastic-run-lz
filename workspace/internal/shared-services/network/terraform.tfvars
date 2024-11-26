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
     

    ]
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
  vpc-peer-common-service-to-prod-01 = {
    local_project_id = "wiai-common-service-f0"
    local_network    = "vpc-common-service-wiai-asso1-primary"
    peer_project_id  = "wiai-prod-host-vpc-68"
    peer_network     = "vpc-prod-wiai-asso1-primary"
  },
}



