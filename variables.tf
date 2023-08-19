variable "project_name" {
  description = "Name of the project on Digital Ocean"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "do_ssh_key_id" {
  description = "DigitalOcean SSH key ID"
  type        = string
}

# To list all regions: `doctl compute region list`
variable "do_region" {
  description = "The DigitalOcean region name"
  type        = string
}

variable "vpc_name" {
  description = "The VPC name"
  type        = string
}

# To list all images: `doctl compute image list --public | grep base`
variable "droplet_image" {
  description = "The image name for the droplets"
  type        = string
}

# To list all sizes: `doctl compute size list`
variable "droplet_web_size" {
  description = "The compute size of the web servers"
  type        = string
}

variable "droplet_web_count" {
  description = "The number of web servers"
  type        = number
}

variable "postgres_size" {
  description = "The size of the Postgres node"
  type        = string
}

variable "postgres_version" {
  description = "The Postgres version"
  type        = string
}
