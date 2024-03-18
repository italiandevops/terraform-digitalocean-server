output "public_ip" {
  value = digitalocean_droplet.server.ipv4_address
}

output "private_ip" {
  value = digitalocean_droplet.server.ipv4_address_private
}
