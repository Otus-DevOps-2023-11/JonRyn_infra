
provider "yandex" {
  #  token     = "y0_AgAAAABzTj_QAATuwQAAAAD3-mzJWa14PFfVRjqnn5BEq5i1ClAFEYM"
  #  cloud_id  = "b1g7htvkb4lqsibcnfl0"
  #  folder_id = "b1g6d2os0e03fvosisbq"
  #  zone      = "ru-central1-a"

  token     = "y0_AgAAAABzTj_QAATuwQAAAAD3-mzJWa14PFfVRjqnn5BEq5i1ClAFEYM"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}


resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      #      image_id = "fd8361l2u2l4mjhj09qp"
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    #    subnet_id = "e9bem33uhju28r5i7pnu"
    #    subnet_id = "e9biv05ge38j96v8dmns"
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("./appuser")
  }


  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }


}
