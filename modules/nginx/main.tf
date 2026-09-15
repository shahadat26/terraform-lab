terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "nginx" {
  name    = var.container_name
  image   = docker_image.nginx.image_id
  restart = "unless-stopped"

  lifecycle {
    prevent_destroy = true
  }
  ports {
    internal = 80
    external = var.nginx_port
  }
}
