terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state"
    key    = "terraform.tfstate"

    endpoints = {
      s3 = "http://192.168.88.44:9000"
    }

    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = true
    use_lockfile                = true
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "nginx" {
  source = "./modules/nginx"

  nginx_port     = var.nginx_port
  nginx_image    = "nginx:1.27-alpine"
  container_name = var.container_name
}
