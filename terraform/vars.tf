variable "location" {
  type        = string
  description = "Region"
  default     = "westeurope"
}

variable "public_key_path" {
  type        = string
  description = "clave pública"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_user" {
  type        = string
  description = "Usuario SSH"
  default     = "amartin"
}
