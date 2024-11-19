
/**
 * Copyright 2022 Niveus Solutions Pvt. Ltd.
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// DATA Block for fetching network self link url
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
