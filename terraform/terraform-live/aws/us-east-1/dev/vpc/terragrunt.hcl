terraform {
    source = "git::ssh://git@github.com/adriell/terraform-module-vpc.git?ref=v1.0.0"
}
include {
    path = find_in_parent_folders()
}
inputs = {
    name = "cloudops"
    cidr = "10.0.0.0/16"

    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets  = ["10.0.10.0/24", "10.0.20.0/24"]

    enable_nat_gateway          = true


    tags = {
      Environment = "dev"
      Terraform   = "true"
    }

}