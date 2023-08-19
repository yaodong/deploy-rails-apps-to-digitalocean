resource "digitalocean_project" "this" {
  name        = var.project_name
  is_default  = false
  environment = title(var.env)
}
