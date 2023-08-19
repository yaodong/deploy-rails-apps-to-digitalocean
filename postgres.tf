resource "digitalocean_database_cluster" "postgres" {
  name                 = "pg-${var.project_name}-${var.env}"
  size                 = var.postgres_size
  engine               = "pg"
  version              = var.postgres_version
  region               = var.do_region
  private_network_uuid = digitalocean_vpc.this.id
  project_id           = digitalocean_project.this.id
  node_count           = 1
}

resource "digitalocean_database_firewall" "web_droplet_routes" {
  cluster_id = digitalocean_database_cluster.postgres.id

  rule {
    type  = "tag"
    value = "${var.project_name}_${var.env}_web"
  }

}
