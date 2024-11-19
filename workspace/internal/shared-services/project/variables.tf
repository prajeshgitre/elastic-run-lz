variable "projects_list" {
  description = "List of projects which needs to be created. project name, project id, folder under which project needs to be created"
  type = map(object({
    project_folder = string
    prefix         = string
    project_name   = string
    project_id     = string
    labels         = map(string)
  }))
}

variable "billing_account" {
  description = "Billing account ID"
  type        = string
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["compute.googleapis.com", "container.googleapis.com"]
}
//billing export variables
variable "dataset_name" {
  description = "Friendly name for the dataset being provisioned."
  type        = string
  default     = null
}

# variable "project_id" {
#   description = "the project id in which dataset need to create"
#   type        = string
# }

variable "description" {
  description = "dataset description."
  type        = string
  default     = null
}

variable "dataset_region" {
  description = "The regional location for the dataset"
  type        = string
  default     = ""
}

variable "billing_sink_name" {
  description = "billing account sink name"
  type        = string
  default     = null
}

// Variable for billing alert
variable "thresholds" {
  description = "thresholds for budget"
  type = list(object({
    percentage = number,
    basis      = string
  }))
  default = []
}

variable "amount" {
  description = "The amount to use as the budget"
  type        = number
}

variable "notification_project_id" {
  description = "common service project id of notification cannel"
  type        = string
}

variable "notification_type" {
  description = "type of notification email/slack"
  type        = string
}

variable "notification_email" {
  description = "list of email"
  type        = string
}

variable "network_self_link" {
  description = "Self link of the network that will be allowed to query the zone."
  default     = []
}