variable "nginx_image" {
  type    = string
  default = "nginx:1.27-alpine"
}

variable "container_name" {
  type    = string
  default = "terraform-nginx"
}

variable "nginx_port" {
  type = number
}
