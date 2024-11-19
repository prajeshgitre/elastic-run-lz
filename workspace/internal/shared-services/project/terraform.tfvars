# project = {
#   name            = "wiai-bootstrap-seed",
#   service_account = "svcacct-bootstrap-seed-tf-lz@wiai-bootstrap-seed.iam.gserviceaccount.com"
# }

//billing account id
billing_account = "01E649-8FAD73-A6893C"


# Details of projects
projects_list = {
  proj1 = {
    prefix         = "wiai"
    project_name   = "common-service"
    project_id     = "common-service"
    project_folder = "folders/849196034032"
    labels = {

    }
  }
}


#budget alert details
amount                  = 50000
notification_type       = "email"
notification_email      = "infra@wadhwaniai.org" #verify
notification_project_id = "wiai-common-service-f0"
thresholds = [{
  percentage = 0.25,
  basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.5,
    basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.75,
    basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.8,
    basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.9
    basis      = "CURRENT_SPEND"
  },
  {
    percentage = 0.25,
    basis      = "FORECASTED_SPEND"
  },
  {
    percentage = 0.5,
    basis      = "FORECASTED_SPEND"
  },
  {
    percentage = 0.75,
    basis      = "FORECASTED_SPEND"
  },
  {
    percentage = 0.8,
    basis      = "FORECASTED_SPEND"
  },
  {
    percentage = 0.9,
    basis      = "FORECASTED_SPEND"
  }
]
