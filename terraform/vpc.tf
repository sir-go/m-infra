resource "yandex_vpc_network" "net" {
  name = "m-net-0"
}

resource "yandex_vpc_subnet" "subnet" {
  name = "m-subnet-0"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.net.id
}
