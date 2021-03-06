terraform {
    source = "git::ssh://git@github.com/adriell/terraform-blueprints.git//terraform-blueprint-alb"
}
include {
    path = find_in_parent_folders()
}

inputs = {
    name            = "cloudops-app"
    instance_type   = "t3.micro"
    bucket          = "cloudops-terragrunt-tfstate-052020"
    bucket_key      = "dev/vpc/terraform.tfstate"
    key_name        = "cloudops-dev"

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