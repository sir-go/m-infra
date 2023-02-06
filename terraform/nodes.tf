resource "yandex_kubernetes_node_group" "m-nodes" {
  cluster_id  = yandex_kubernetes_cluster.cluster.id
  version     = "1.21"
  name        = "m-nodes"
  description = "Store Nodes"
  instance_template {
    platform_id = "standard-v3"
    //noinspection HCLUnknownBlockType
    network_interface {
      ipv4 = true
      ipv6 = false
      nat = true
      subnet_ids = [
        yandex_vpc_subnet.subnet.id
      ]
    }
    resources {
      core_fraction = 20
      memory = 4
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    auto_scale {
      initial = 2
      max = 3
      min = 2
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-b"
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
  }
}
