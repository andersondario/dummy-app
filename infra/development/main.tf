terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.19.0"
        }
    }

    backend "remote" {
		organization = "andersondario"
		workspaces {
			name = "dummy-app-qa" 
		}
	}
}

provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "ecs" {
    source     = "github.com/andersondario/terraform-sample//modules/aws/ecs"  
    cluster_name   = "cluster-qa"
    app_count = 1
}
