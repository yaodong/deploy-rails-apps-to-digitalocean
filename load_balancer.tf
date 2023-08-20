resource "digitalocean_loadbalancer" "this" {
  name       = "${var.project_name}-${var.env}"
  region     = var.do_region
  vpc_uuid   = digitalocean_vpc.this.id
  project_id = digitalocean_project.this.id

  forwarding_rule {
    entry_port       = 443
    entry_protocol   = "https"
    target_port      = 80
    target_protocol  = "http"
    tls_passthrough  = false
    certificate_name = var.certificate_name
  }

  healthcheck {
    port     = 80
    protocol = "http"
    path     = "/up"
  }

  droplet_tag = "${var.project_name}_${var.env}_web"

}
