project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}

//billing account id
billing_account = "01C4D7-B0D936-B27FBF"


# Details of projects
projects_list = {
  proj1 = {
    prefix         = "prj"
    project_name   = "prod-int-elasticrun-host"
    project_id     = "prod-int-elasticrun-host"
    project_folder = "folders/1081601249902"
    labels = {
      environment = "production"
      owner       = "manoj"
      department  = "elasticrun"
      customer    = "manoj"
      businessunit = "internal"
         
    }
  }
}


#budget alert details
amount                  = 50000
notification_type       = "email"
notification_email      = "manoj.thangaraj@elastic.run" 
notification_project_id = "prj-cmn-int-elasticrun5a"
thresholds = [
   {
    percentage = 0.5,
    basis      = "FORECASTED_SPEND"
  },

  {
    percentage = 0.75,
    basis      = "CURRENT_SPEND"
  },

  {
    percentage = 0.9
    basis      = "CURRENT_SPEND"
  },
  
]
