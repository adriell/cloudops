terraform {
    source = "../../../../../terraform-blueprints/terraform-blueprint-dns"
}
include {
    path = find_in_parent_folders()
}
inputs = {
    name            = "cloudops.infra.lab"
    
    bucket          = "cloudops-terragrunt-tfstate-052020"
    bucket_key      = "dev/vpc/terraform.tfstate"

    tags = {
      Environment = "dev"
      Terraform   = "true"
    }
}