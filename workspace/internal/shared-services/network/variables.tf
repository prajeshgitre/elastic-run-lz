#vpc variables
variable "vpc_list" {
  description = "List of vpcs which needs to be created. alongwith their detail"
  type = map(object({
    vpc_name                               = string
    project_id                             = string
    delete_default_internet_gateway_routes = bool
    subnets                                = list(map(string))
    secondary_ranges                       = map(list(object({ range_name = string, ip_cidr_range = string })))
  }))
}

# # #cloud dns variables
# variable "cloud_dns" {
#   description = "List of Private dns"
#   type = list(object({
#     type   = string
#     name   = string
#     domain = string
#     recordsets = list(object({
#       name    = string,
#       type    = string,
#       ttl     = number,
#       records = list(string)
#     }))
#   }))
#   default = []
# }

# variable "dns_project_id" {
#   type        = string
#   description = "Project id of the VPC"
# }

# variable "dns_network" {
#   type        = string
#   description = "vpc name for cloud dns"
# }

# //Shared VPC variables

variable "host_project_id" {
  type        = string
  default = "wiai-common-service-f0"
  description = "Project id of the shared VPC host project."
}

# passed-in values can be dynamic, so variables used in count need to be separate

# variable "service_project_ids" {
#   type        = list(string)
#   description = "Ids of the service projects that will be attached to the Shared VPC."
# }

# variable "host_subnets" {
#   type        = list(string)
#   description = "List of subnet names on which to grant network user role."
#   default     = []
# }

# variable "host_subnet_regions" {
#   type        = list(string)
#   description = "List of subnet regions, one per subnet."
#   default     = []
# }

# variable "host_subnet_users" {
#   type        = map(any)
#   description = "Map of comma-delimited IAM-style members to which network user roles for subnets will be assigned."
#   default     = {}
# }

variable "cloud_nat" {
  description = "variable to create cloud nat "
  type = list(object({
    project_id                          = string
    router_network                      = string
    region                              = string
    nat_name                            = string
    router_name                         = string
    static_ip_name                      = list(string)
    create_router                       = bool
    log_config_enable                   = bool
    log_config_filter                   = string
    source_subnetwork_ip_ranges_to_nat  = string
    enable_endpoint_independent_mapping = bool
    min_ports_per_vm                    = number
    subnetworks = list(object({
      name                     = string,
      source_ip_ranges_to_nat  = list(string)
      secondary_ip_range_names = list(string)
    }))
  }))
  default = []
}

#vpc-peering variables
variable "vpc_peering_list" {
  description = "List of vpcs which needs to be peer"
  type = map(object({
    local_project_id = string
    local_network    = string
    peer_project_id  = string
    peer_network     = string
  }))
}

variable "reserve_static_ip" {
  description = "reserve ip"
  type = list(object({
    name         = string
    project_id   = string
    region       = string
    address_type = string
  }))
}

#firewall variables 
variable "firewall_rules_list" {
  type = map(object({
    project_id   = string
    network_name = string
    rules = list(object({
      name                    = string
      description             = string
      direction               = string
      priority                = number
      ranges                  = list(string)
      source_tags             = list(string)
      source_service_accounts = list(string)
      target_tags             = list(string)
      target_service_accounts = list(string)
      allow = list(object({
        protocol = string
        ports    = list(string)
      }))
      deny = list(object({
        protocol = string
        ports    = list(string)
      }))
      log_config = object({
        metadata = string
      })
    }))
  }))
}


# variable "subnet_level_firewall_rules_list" {
#   type = map(object({
#     project_id   = string
#     network_name = string
#     rules = list(object({
#       name                    = string
#       description             = string
#       direction               = string
#       priority                = number
#       destination_ranges                 = list(string)
#       source_ranges           = list(string)
#       source_tags             = list(string)
#       source_service_accounts = list(string)
#       target_tags             = list(string)
#       target_service_accounts = list(string)
#       allow = list(object({
#         protocol = string
#         ports    = list(string)
#       }))
#       deny = list(object({
#         protocol = string
#         ports    = list(string)
#       }))
#       log_config = object({
#         metadata = string
#       })
#     }))
#   }))
# }

#variables for private service connection
# variable "private_service_access" {
#   description = "private service access variable"
#   type = map(object({
#     address  = string
#     vpc_name = string
#     name     = string
#   }))
# }
