project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}
vpn_list = {
  vpn1 = {
    region         = "asia-south2"
    gcp_project    = "prj-prod-int-elasticrun-hostc9"
    network        = "vpc-elasticrun-prod-as2-shared"
    gateway_name   = "vpn-peer-gw-elasticrun-prod-dr-azure-gcp-classic-as2-01"
    static_ip_name = "sip-ext-prod-elasticrun-as1a-gw-vpn"
    tunnel = [
    #   {
    #     tunnel_name             = "vpn-o4s-prod-aws-gcp-classic-as1a-tunnel-01"
    #     peer_ip                 = "18.139.15.25"
    #     shared_secret           = "pzaejYWBTK3oGi.sM.E5qggScW1lfdyr"
    #     remote_traffic_selector = ["10.1.0.0/16"]
    #   },
    #   {
    #     tunnel_name             = "vpn-o4s-prod-aws-gcp-classic-as1a-tunnel-02"
    #     peer_ip                 = "52.77.59.216"
    #     shared_secret           = ".Bti3Fjq0jBakfQNp6QshNRFe0LPswhX"
    #     remote_traffic_selector = ["10.1.0.0/16"]
    #   }

    ]
  },
}