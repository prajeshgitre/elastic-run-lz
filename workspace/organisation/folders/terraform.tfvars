project = {
  name            = "prj-seed-elasticrun",
  service_account = "sa-terraform@prj-seed-elasticrun.iam.gserviceaccount.com"
}


#organization details
parent_id   = "1098389060758" 
parent_type = "folders"


main_folders = {
  "fldr-internal" = ["fldr-internal"]  
  "fldr-customer" = ["fldr-customer"]  
}

# Sub folders configuration (Level-3)
sub_folders = {
  "fldr-internal" = [
    "fldr-int-staging",      
    "fldr-int-production",      
    "fldr-int-cmn-service"   
  ],
  
  "fldr-customer" = [
    "fldr-cx-staging",      
    "fldr-cx-production",      
    "fldr-cx-cmn-service"    
  ]
}



