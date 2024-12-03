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
      {
        tunnel_name             = "vpn-er-int-prd-azure-gcp-classic-as2-tunnel-01"
        peer_ip                 = "4.224.144.158"
        shared_secret           = "El@sticRun_!#%"
        remote_traffic_selector = ["172.20.0.0/16"]
      },
      {
        tunnel_name             = "vpn-er-int-prd-azure-gcp-classic-as2-tunnel-02"
        peer_ip                 = "4.224.144.42"
        shared_secret           = "El@sticRun_!#%"
        remote_traffic_selector = ["172.20.0.0/16"]
      }

    ]
  },
}