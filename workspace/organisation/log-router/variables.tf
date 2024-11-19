/*
 * Copyright 2024 Niveus Solutions Pvt. Ltd.
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "parent_id" {
  description = "The resource ID of the parent Folder or Organization"
  type        = string
}

variable "parent_type" {
  description = "Parent Type : folder or organization"
  type        = string
  default     = "folders"
}

variable "log_folders" {
  description = "Folder names"
  type        = list(string)
  default = [
  ]
}

variable "bucket_project" {
  description = "project where the bucket need to create (common service)"
  type        = string
  default     = ""
}

variable "log_filter" {
  description = "log filter query for centralized logging"
  type        = string
  default     = ""
}

variable "bucket_location" {
  description = "The location of the storage bucket."
  type        = string
  default     = "asia-south1"
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration."
  type = list(object({
    # Object with keys:
    # - type - The type of the action of this Lifecycle Rule. Supported values: Delete and SetStorageClass.
    # - storage_class - (Required if action type is SetStorageClass) The target Storage Class of objects affected by this Lifecycle Rule.
    action = any

    # Object with keys:
    # - age - (Optional) Minimum age of an object in days to satisfy this condition.
    # - created_before - (Optional) Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition.
    # - with_state - (Optional) Match to live and/or archived objects. Supported values include: "LIVE", "ARCHIVED", "ANY".
    # - matches_storage_class - (Optional) Storage Class of objects to satisfy this condition. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY.
    # - num_newer_versions - (Optional) Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition.
    condition = any
  }))
  default = []
}

#org policy enable
variable "org-policy" {
  description = "List of org-policy"
  type = list(object({
    constraint        = string
    policy_type       = string
    policy_for        = string
    organization_id   = string
    folder_id         = string
    project_id        = string
    enforce           = bool
    allow             = list(string)
    allow_list_length = number
    exclude_folders   = set(string)
    exclude_projects  = set(string)
  }))
  default = []
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)
  default     = null
}