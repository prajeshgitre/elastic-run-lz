/*
 * Copyright 2023 Niveus Solutions Pvt. Ltd.
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//module to create classic VPN
module "classic-vpn" {
  providers = {
    google      = google.project
    google-beta = google-beta.project-beta
  }
  source         = "../../../../modules/terraform-google-classic-vpn"
  for_each       = var.vpn_list
  region         = each.value.region
  gcp_project    = each.value.gcp_project
  network        = each.value.network
  gateway_name   = each.value.gateway_name
  tunnel         = each.value.tunnel
  static_ip_name = each.value.static_ip_name
}
