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

variable "parent_id" {
  description = "The resource ID of the parent Folder or Organization"
  type        = string
}

variable "custom_org-policy" {
  type = list(object({
    parent         = string
    name           = string
    display_name   = string
    description    = string
    action_type    = string
    condition      = string
    method_types   = list(string)
    resource_types = list(string)
  }))
  default = []
}

variable "parent_type" {
  description = "Parent Type : folder or organization"
  type        = string
  default     = "folders"
}





