# /*
#  * Copyright 2024 Niveus Solutions Pvt. Ltd.
#  *
#  *
#  * Unless required by applicable law or agreed to in writing, software
#  * distributed under the License is distributed on an "AS IS" BASIS,
#  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  * See the License for the specific language governing permissions and
#  * limitations under the License.
#  */

//Data block to get VPC details
data "google_compute_network" "local" {
  provider = google.project
  for_each = var.vpc_peering_list
  name     = each.value.local_network
  project  = each.value.local_project_id
}

//Data block to get VPC details
data "google_compute_network" "peer" {
  provider = google.project
  for_each = var.vpc_peering_list
  name     = each.value.peer_network
  project  = each.value.peer_project_id
}

# //module for creation of VPC Peering
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