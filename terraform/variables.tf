variable "region" {
  default = "ap-southeast-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/24"
}

variable "ssh_public_key" {
  description = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOcvRtq3Tz29LXQigXkz2T53iB0/GC4K+hO2703xvLVJ dinazmi@ZeddAzmi"
  type        = string
}
