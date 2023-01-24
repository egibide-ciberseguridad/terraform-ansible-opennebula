output "name" {
  value = opennebula_virtual_machine.ubuntu.name
}

output "ip_privada" {
  value = opennebula_virtual_machine.ubuntu.nic[0].computed_ip
}

output "ip_publica" {
  value = var.ip_publica[opennebula_virtual_machine.ubuntu.nic[0].computed_ip]
}

resource "local_file" "ips" {
  content = join(" ", [
    opennebula_virtual_machine.ubuntu.nic[0].computed_ip,
    var.ip_publica[opennebula_virtual_machine.ubuntu.nic[0].computed_ip]
  ])
  filename = "output/ips"
}
