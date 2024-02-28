#variable "cloud_id" {
#  description = "Cloud"
  #  default = "b1g7htvkb4lqsibcnfl0"
#}
#variable "folder_id" {
#  description = "Folder"
  #  default = "b1g6d2os0e03fvosisbq"
#}
#variable "zone" {
#  description = "Zone"
  # Значение по умолчанию
  #  default = "ru-central1-a"
#}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
#variable "image_id" {
#  description = "Disk image"
  #  default = "fd8361l2u2l4mjhj09qp"
#}
variable "subnet_id" {
  description = "Subnet"
  #  default = "e9biv05ge38j96v8dmns"
}
#variable service_account_key_file{
#  description = "key.json"
#}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
