terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.80.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    region     = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  service_account_key_file = "yc-key.json"
  zone      = "ru-central1-b"
}
