project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}

#Cloud vpc
vpc_list = {
  vpc-elasticrun-common-service-as2-single         = {
    vpc_name                               = "vpc-elasticrun-common-service-as2-single"
    project_id                             = "prj-cmn-int-elasticrun5a"
    delete_default_internet_gateway_routes = false
    subnets = [
      {
        subnet_name           = "sb-common-service-as2-01"
        subnet_ip             = "172.20.27.0/24"
        subnet_region         = "asia-south2"
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



reserve_static_ip = [
  {
    name         = "si-common-service-as2-cloud-nat"
    project_id   = "prj-cmn-int-elasticrun5a"
    region       = "asia-south2"
    address_type = "EXTERNAL"
  },
]

cloud_nat = [
  {
    project_id                          = "prj-cmn-int-elasticrun5a"
    router_network                      = "vpc-elasticrun-common-service-as2-single"
    region                              = "asia-south2"
    nat_name                            = "cn-elasticrun-common-service-as2-01"
    router_name                         = "cr-common-service-as2-01"
    create_router                       = true
    log_config_enable                   = false
    log_config_filter                   = "ALL"
    enable_dynamic_port_allocation      = true
    enable_endpoint_independent_mapping = false
    min_ports_per_vm                    = 2048
    //static address should be declared in above static_ip_name variable
    static_ip_name                      = ["si-common-service-as2-cloud-nat"]
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    // "LIST_OF_SUBNETWORKS"
    subnetworks = [
    ]
  },
]

#VPC peering 

vpc_peering_list = {
  vpc-peer-common-service-to-prod-01 = {
    local_project_id = "prj-cmn-int-elasticrun5a"
    local_network    = "vpc-elasticrun-common-service-as2-single"
    peer_project_id  = "prj-prod-int-elasticrun-hostc9"
    peer_network     = "vpc-elasticrun-prod-as2-shared"
  },
}



