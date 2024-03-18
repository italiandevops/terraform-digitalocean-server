# FIREWALL

resource "digitalocean_firewall" "web" {
  name = "Firewall"

  droplet_ids = [digitalocean_droplet.server.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["XXX/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# VPC

resource "digitalocean_vpc" "vpc" {
  name     = "vpc"
  region   = "fra1"
  ip_range = "10.0.1.0/24"
}

# SERVER

resource "digitalocean_droplet" "server" {
  image    = var.image_name
  name     = "server01"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ipv6     = true
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [data.digitalocean_ssh_key.default.id]
}