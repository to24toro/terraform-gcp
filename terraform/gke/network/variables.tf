variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "ip_cidr_range" {
  type = string
  default = "10.2.0.0/16"
}