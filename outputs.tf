output "nginx_url" {
  value = "http://localhost:${var.nginx_port}"
}

output "container_name" {
  value = module.nginx.container_name
}

output "container_id" {
  value = module.nginx.container_id
}
