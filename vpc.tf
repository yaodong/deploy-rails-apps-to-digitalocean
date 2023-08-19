resource "digitalocean_vpc" "this" {
  name   = var.vpc_name
  region = var.do_region
}
