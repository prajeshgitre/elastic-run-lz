# Google Cloud Project Terraform Module  

This module allows you to create opinionated Google Cloud Platform projects. It
creates projects and API enablement to follow best practices.

## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded][terraform-0.13-upgrade] and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [9.2.0].

```hcl
#resource for adding suffix to project_id
resource "random_id" "project_id_suffix" {
  byte_length = 1
}
//Module for creation of prod host project under common service folder
module "create_project" {
  source          = "../../../../modules/terraform-google-projects"
  for_each        = var.projects_list
  name            = each.value.project_name
  parent          = each.value.project_folder
  prefix          = each.value.prefix
  project_id      = format("%s%s", each.value.project_id, random_id.project_id_suffix.hex)
  labels          = each.value.labels
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}

//Module for creation of service project
module "create_service_project" {
  source          = "../../../../modules/terraform-google-projects"
  for_each        = var.service_projects_list
  name            = each.value.project_name
  parent          = each.value.project_folder
  prefix          = each.value.prefix
  project_id      = format("%s%s", each.value.project_id, random_id.project_id_suffix.hex)
  labels          = each.value.labels
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}
```


## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html) and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [v3.1.0](https://registry.terraform.io/modules/terraform-google-modules/-cloud-dns/google/v3.1.0).


## Usage

Basic usage of this module for a private zone is as follows:

```hcl
// DATA Block for fetching network self link url
data "google_compute_network" "network" {
  name    = "<network-name>"
  project = "<host-project-id>"
}

data "google_compute_network" "network" {
  provider = google.project
  name     = var.dns_network
  project  = var.dns_project_id
}

module "cloud-dns" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                             = "../../../../modules/terraform-google-cloud-dns"
  for_each                           = { for dns in var.cloud_dns : dns.name => dns }
  project_id                         = var.dns_project_id
  type                               = each.value.type
  name                               = each.value.name
  domain                             = each.value.domain
  private_visibility_config_networks = [data.google_compute_network.network.self_link]
  recordsets                         = each.value.recordsets
}
```

# Creation of cloud DNS  from the tfvars
```hcl
dns_network    = "vpc-seed-wiai-asso1-primary"
dns_project_id = "wiai-bootstrap-seed"
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
]
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_key\_specs\_key | Object containing default key signing specifications : algorithm, key\_length, key\_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone#dnssec_config for futhers details | `any` | `{}` | no |
| default\_key\_specs\_zone | Object containing default zone signing specifications : algorithm, key\_length, key\_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone#dnssec_config for futhers details | `any` | `{}` | no |
| description | zone description (shown in console) | `string` | `"Managed by Terraform"` | no |
| dnssec\_config | Object containing : kind, non\_existence, state. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone#dnssec_config for futhers details | `any` | `{}` | no |
| domain | Zone domain, must end with a period. | `string` | n/a | yes |
| enable\_logging | Enable query logging for this ManagedZone | `bool` | `false` | no |
| force\_destroy | Set this true to delete all records in the zone. | `bool` | `false` | no |
| labels | A set of key/value label pairs to assign to this ManagedZone | `map(any)` | `{}` | no |
| name | Zone name, must be unique within the project. | `string` | n/a | yes |
| private\_visibility\_config\_networks | List of VPC self links that can see this zone. | `list(string)` | `[]` | no |
| project\_id | Project id for the zone. | `string` | n/a | yes |
| recordsets | List of DNS record objects to manage, in the standard terraform dns structure. | <pre>list(object({<br>    name    = string<br>    type    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| service\_namespace\_url | The fully qualified or partial URL of the service directory namespace that should be associated with the zone. This should be formatted like https://servicedirectory.googleapis.com/v1/projects/{project}/locations/{location}/namespaces/{namespace_id} or simply projects/{project}/locations/{location}/namespaces/{namespace\_id}. | `string` | `""` | no |
| target\_name\_server\_addresses | List of target name servers for forwarding zone. | `list(map(any))` | `[]` | no |
| target\_network | Peering network. | `string` | `""` | no |
| type | Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering', 'reverse\_lookup' and 'service\_directory'. | `string` | `"private"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->



## Upgrading

The following guides are available to assist with upgrades:

- [1.X -> 2.0](./docs/upgrading_to_vpn_v2.0.md)
- [2.X -> 3.0](./docs/upgrading_to_vpn_v3.0.md)
- 
## Requirements
### Terraform plugins
- [Terraform](https://www.terraform.io/downloads.html) 1.3+
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin v4.64+

### Configure a Service Account
In order to execute this module you must have a Service Account with the following roles:
- roles/compute.networkAdmin on the organization

### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:
- Compute Engine API - compute.googleapis.com



# Google Network Peering

This module allows creation of a [VPC Network Peering](https://cloud.google.com/vpc/docs/vpc-peering) between two networks.

The resources created/managed by this module are:

- one network peering from `local network` to `peer network`, which will be named `<prefix>-<local network name>-<peer network name>`
- one network peering from `peer network` to `local network`, which will be named `<prefix>-<peer network name>-<local network name>`

## Usage

Basic usage of this module is as follows:

```hcl
//Data block to get VPC details
data "google_compute_network" "local" {
  for_each = var.vpc_peering_list
  name     = each.value.local_network
  project  = each.value.local_project_id
}

//Data block to get VPC details
data "google_compute_network" "peer" {
  for_each = var.vpc_peering_list
  name     = each.value.peer_network
  project  = each.value.peer_project_id
}

//module for creation of VPC Peering
module "peering" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source                                    = "../../../../modules/terraform-google-network/modules/network-peering"
  for_each                                  = var.vpc_peering_list
  prefix                                    = "vpc-peer"
  export_local_custom_routes                = true
  export_peer_custom_routes                 = true
  export_local_subnet_routes_with_public_ip = true
  export_peer_subnet_routes_with_public_ip  = true
  local_network                             = data.google_compute_network.local[each.key].self_link
  peer_network                              = data.google_compute_network.peer[each.key].self_link
}
```
# Creation of VPC Peering from tfvars
```hcl
<!-- vpc_peering_list = {
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
} -->
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| export\_local\_custom\_routes | Export custom routes to peer network from local network. | `bool` | `false` | no |
| export\_local\_subnet\_routes\_with\_public\_ip | Export custom routes to peer network from local network (defaults to true; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#export_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `true` | no |
| export\_peer\_custom\_routes | Export custom routes to local network from peer network. | `bool` | `false` | no |
| export\_peer\_subnet\_routes\_with\_public\_ip | Export custom routes to local network from peer network (defaults to false; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#import_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `false` | no |
| local\_network | Resource link of the network to add a peering to. | `string` | n/a | yes |
| module\_depends\_on | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| peer\_network | Resource link of the peer network. | `string` | n/a | yes |
| prefix | Name prefix for the network peerings | `string` | `"network-peering"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Terraform Network Module

This module makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:

- A Google Virtual Private Network (VPC)
- Subnets within the VPC
- Secondary ranges for the subnets (if applicable)

Sub modules are provided for creating individual vpc, subnets, and routes. See the modules directory for the various sub modules usage.

## Compatibility

This module is meant for use with Terraform 1.3+ and tested using Terraform 1.4+.
If you find incompatibilities using Terraform `>=1.3`, please open an issue.

If you haven't [upgraded][terraform-0.13-upgrade] and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [2.6.0].

## Usage
You can go to the examples folder, however the usage of the module could be like this in your own main.tf file:

```hcl
module "vpc" {
    source  = "../../modules/terraform-google-network"
    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-west1"
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}
```
# Creation of VPC and subnet from tfvars
```hcl
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
        subnet_flow_logs      = "false"
        description           = "subnet for common service"
      },
    ]
      secondary_ranges = {

      }
  }
}
```
  

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| delete\_default\_internet\_gateway\_routes | If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted | `bool` | `false` | no |
| description | An optional description of this resource. The resource must be recreated to modify this field. | `string` | `""` | no |
| egress\_rules | List of egress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| firewall\_rules | This is DEPRICATED and available for backward compatiblity. Use ingress\_rules and egress\_rules variables. List of firewall rules | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    direction               = optional(string, "INGRESS")<br>    priority                = optional(number, null)<br>    ranges                  = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| ingress\_rules | List of ingress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| mtu | The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively. | `number` | `0` | no |
| network\_firewall\_policy\_enforcement\_order | Set the order that Firewall Rules and Firewall Policies are evaluated. Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`. (default null or equivalent to `AFTER_CLASSIC_FIREWALL`) | `string` | `null` | no |
| network\_name | The name of the network being created | `string` | n/a | yes |
| project\_id | The ID of the project where this VPC will be created | `string` | n/a | yes |
| routes | List of routes being created in this VPC | `list(map(string))` | `[]` | no |
| routing\_mode | The network routing mode (default 'GLOBAL') | `string` | `"GLOBAL"` | no |
| secondary\_ranges | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| shared\_vpc\_host | Makes this project a Shared VPC host if 'true' (default 'false') | `bool` | `false` | no |
| subnets | The list of subnets being created | <pre>list(object({<br>    subnet_name                      = string<br>    subnet_ip                        = string<br>    subnet_region                    = string<br>    subnet_private_access            = optional(string)<br>    subnet_private_ipv6_access       = optional(string)<br>    subnet_flow_logs                 = optional(string)<br>    subnet_flow_logs_interval        = optional(string)<br>    subnet_flow_logs_sampling        = optional(string)<br>    subnet_flow_logs_metadata        = optional(string)<br>    subnet_flow_logs_filter          = optional(string)<br>    subnet_flow_logs_metadata_fields = optional(list(string))<br>    description                      = optional(string)<br>    purpose                          = optional(string)<br>    role                             = optional(string)<br>    stack_type                       = optional(string)<br>    ipv6_access_type                 = optional(string)<br>  }))</pre> | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Subnet Inputs

The subnets list contains maps, where each object represents a subnet. Each map has the following inputs (please see examples folder for additional references):

| Name                         | Description                                                                                                     |  Type  |         Default          | Required |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | :----: | :----------------------: | :------: |
| subnet\_name                 | The name of the subnet being created                                                                            | string |            -             |   yes    |
| subnet\_ip                   | The IP and CIDR range of the subnet being created                                                               | string |            -             |   yes    |
| subnet\_region               | The region where the subnet will be created                                                                     | string |            -             |   yes    |
| subnet\_private\_access      | Whether this subnet will have private Google access enabled                                                     | string |        `"false"`         |    no    |
| subnet\_private\_ipv6\_access| The private IPv6 google access type for the VMs in this subnet                                                  | string |            -             |    no    |
| subnet\_flow\_logs           | Whether the subnet will record and send flow log data to logging                                                | string |        `"false"`         |    no    |
| subnet\_flow\_logs\_interval | If subnet\_flow\_logs is true, sets the aggregation interval for collecting flow logs                           | string |    `"INTERVAL_5_SEC"`    |    no    |
| subnet\_flow\_logs\_sampling | If subnet\_flow\_logs is true, set the sampling rate of VPC flow logs within the subnetwork                     | string |         `"0.5"`          |    no    |
| subnet\_flow\_logs\_metadata | If subnet\_flow\_logs is true, configures whether metadata fields should be added to the reported VPC flow logs | string | `"INCLUDE_ALL_METADATA"` |    no    |
| subnet\_flow\_logs\_filter | Export filter defining which VPC flow logs should be logged, see https://cloud.google.com/vpc/docs/flow-logs#filtering for formatting details  | string | `"true"` |    no    |
| subnet\_flow\_logs\_metadata\_fields | List of metadata fields that should be added to reported logs. Can only be specified if VPC flow logs for this subnetwork is enabled and "metadata" is set to CUSTOM_METADATA.  | any | - |    no    |
| description                         | An optional description of this resource. Provide this property when you create the resource. This field can be set only at resource creation time  | string | - |    no    |
| purpose | The purpose of the subnet usage. Whether it is to be used as a regular subnet or for proxy or loadbalacing purposes, see https://cloud.google.com/vpc/docs/subnets#purpose for more details  | string | `"PRIVATE"` |    no    |
| role                         | The role of the subnet when using it as a proxy or loadbalancer network. Whether it is to be used as the active or as a backup subnet, see https://cloud.google.com/load-balancing/docs/proxy-only-subnets#proxy_only_subnet_create for more details  | string |            -             |    no    |
| stack\_type                  | `IPV4_ONLY` or `IPV4_IPV6` for dual-stack networking | string | - | no |
| ipv6\_access\_type           | `INTERNAL` or `EXTERNAL`. `INTERNAL` requires ULA be enabled on the VPC | string | - | no |

