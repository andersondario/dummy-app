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
			name = "dummy-app-production" 
		}
	}
}

provider "aws" {
	region     = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}

module "ecs" {
	source       = "github.com/andersondario/terraform-modules//modules/aws/ecs"  
	app_name     = "dummy-app"
	cluster_name = "cluster-prod"
	env_name     = "production"
	app_count    = 2
}
