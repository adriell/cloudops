terraform {
    source = "git::ssh://git@github.com/adriell/terraform-blueprints.git//terraform-blueprint-app"
}
include {
    path = find_in_parent_folders()
}
inputs = {
    #DNS
    domain_name      = "cloudops.infra.lab"
    record_name      = "app.cloudops.infra.lab"
    
    
    #ALB
    name              = "app"
    alb_name          = "cloudops-app"
    health_check_path = "/"
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
    #ASG
    intance_type = "t3.micro"
    key_name     = "cloudops-dev"
    alb_dns_name = "cloudops-app-1653218192.us-east-1.elb.amazonaws.com" 
    alb_zone_id  = "Z35SXDOTRQ7X7K"

    bucket          = "cloudops-terragrunt-tfstate-052020"
    bucket_key      = "dev/vpc/terraform.tfstate"

}