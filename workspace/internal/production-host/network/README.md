# Google Cloud Project Terraform Module  

This module allows you to create opinionated Google Cloud Platform projects. It
creates projects and API enablement to follow best practices.

## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded][terraform-0.13-upgrade] and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [9.2.0].

## Usage

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

# Google Cloud VPC Firewall Rules

This module allows creation of custom VPC firewall rules.

## Usage

Variable `rules` details are available [here](#rules). Basic usage of this module is as follows:

# Creation of firewall rules from tfvars
```hcl
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
  reserve_static_ip = []
  {
    name         = "si-prod-shrd-as2-cloud-nat"
    project_id   = "prj-prod-int-elasticrun-hostc9"
    region       = "asia-south2"
    address_type = "EXTERNAL"

  },
  ```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_rules | List of egress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| ingress\_rules | List of ingress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| network\_name | Name of the network this set of firewall rules applies to. | `string` | n/a | yes |
| project\_id | Project id of the project that holds the network. | `string` | n/a | yes |
| rules | This is DEPRICATED and available for backward compatiblity. Use ingress\_rules and egress\_rules variables. List of custom rule definitions | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    direction               = optional(string, "INGRESS")<br>    priority                = optional(number, null)<br>    ranges                  = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## rules
In a [firewall rule](https://cloud.google.com/firewall/docs/firewalls), you specify a set of components that define what the rule does. Some of the values are optional and some have default value. For sample code check [firewall rules][examples](https://github.com/terraform-google-modules/terraform-google-network/tree/master/examples) folder. variable `rule.ranges` is kept for backward compatibility and should not be set at the same time as `rule.destination_ranges` OR `rule.source_ranges` otherwise module will generate an error message `ranges may not be set at the same time as destination_ranges OR source_ranges`.

- `ranges`: IP address range. This may not be set at the same time as `destination_ranges` OR `source_ranges`.
- `source_ranges`: (Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. These ranges must be expressed in CIDR format. `source_ranges` may not be set at the same time as `ranges`
- `destination_ranges`: (Optional) If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format. `destination_ranges` may not be set at the same time as `ranges`
- `name`: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- `description`: (Optional) An optional description of this resource. Provide this property when you create the resource
- `direction`: (Optional) Direction of traffic to which this firewall applies; default is INGRESS
- `priority`: (Optional) Priority for this rule. This is an integer between 0 and 65535, both inclusive. When not specified, the value assumed is 1000

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
      {
        subnet_name           = "sb-prod-as2-k8s-app-cp"
        subnet_ip             = "172.20.24.0/28"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "gke control plane "
      },
       {
        subnet_name           = "sb-prod-as2-k8s-eng-01"
        subnet_ip             = "172.20.28.0/22"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "gke eng subnet "
      },
      {
        subnet_name           = "sb-prod-as2-k8s-eng-cp"
        subnet_ip             = "172.20.52.0/28"
        subnet_region         = "asia-south2"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "gke control plan "
      },


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
```
# creation of cloud nat
```hcl
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

