remote_state {
    backend = "s3"

    generate = {
        path        = "backend.tf"
        if_exists   = "overwrite_terragrunt"
    }

    config = {
        
        bucket         = "cloudops-terragrunt-tfstate-052020"

        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "cloudops-terragrunt-tfstate052020"
    }
}