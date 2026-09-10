variable "nginx_port" {
  type    = number
  default = 8082
}

variable "container_name" {
  type    = string
  default = "terraform-nginx"
}
