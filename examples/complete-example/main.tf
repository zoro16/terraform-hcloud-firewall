# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}


module "firewall" {
  source = "../../"

  create_firewall = true

  firewall_name = "test-fw"

  firewall_labels = {
    "Name" : "testing-fw"
  }

  firewall_rules = [
    {
      direction = "in"
      protocol  = "tcp"
      port      = "80"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    },
    {
      direction = "in"
      protocol  = "tcp"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
      port        = "8080"
      description = "This accepts HTTP from anywhere"
    },
    {
      direction = "out"
      protocol  = "tcp"
      destination_ips = [
        "10.22.0.0/24",
      ]
      port = "80"
    }
  ]

  firewall_apply_to = {
    label_selector = "key=value"
  }

}
