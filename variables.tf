# DO droplet size
variable "droplet_size" {
  description = "the size slug of a droplet size"
  default     = "s-1vcpu-1gb"
}

# Operating system release
variable "image_name" {
  description = "The image name or slug to lookup."
  default     = "ubuntu-22-04-x64"
}

# Datacenter location
variable "region" {
  description = "The Digitalocean datacenter to create resources in."
  default     = "fra1"
}

# Token variable
variable "do_token" {
  default = ""
}

# Public key stored at DO
data "digitalocean_ssh_key" "default" {
  name = "XXX"
}

