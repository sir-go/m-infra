resource "yandex_kubernetes_cluster" "cluster" {
  name        = "m-cluster-0"
  description = "cluster for Store"
  master {
    public_ip = true
    zonal {
      zone      =  "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet.id
    }
  }

  service_account_id      = var.yc_srv_acc_id
  node_service_account_id = var.yc_srv_acc_id
  release_channel         = "REGULAR"
  network_id              = yandex_vpc_network.net.id
}
