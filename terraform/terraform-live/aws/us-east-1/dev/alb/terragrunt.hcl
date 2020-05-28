terraform {
    source = "../../../../../terraform-blueprints/terraform-blueprint-alb"
}
include {
    path = find_in_parent_folders()
}
inputs = {
    name            = "cloudops-alb"
    listener_port   = "80"
    bucket          = "cloudops-terragrunt-tfstate-052020"
    bucket_key      = "dev/vpc/terraform.tfstate"

    ingress_rules = [
        {
            protocol    = "tcp"
            port        = 80
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

    tags = {
      Environment = "dev"
      Terraform   = "true"
    }
}