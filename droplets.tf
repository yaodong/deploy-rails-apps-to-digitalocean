resource "digitalocean_droplet" "web" {
  count      = var.droplet_web_count
  vpc_uuid   = digitalocean_vpc.this.id
  image      = var.droplet_image
  name       = "web-${count.index + 1}"
  region     = var.do_region
  size       = var.droplet_web_size
  monitoring = true
  ssh_keys = [
    var.do_ssh_key_id
  ]
  tags = [
    "${var.project_name}_${var.env}_web"
  ]
}

resource "digitalocean_project_resources" "droplet_web" {
  project = digitalocean_project.this.id

  resources = [
    for d in digitalocean_droplet.web : d.urn
  ]
}
