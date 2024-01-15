variable "vpc_name" {
  type        = string
  default = "nginx-vpc"
}

variable "cidr" {
  type        = string
  default = "192.168.0.0/16"
}

variable "azs" {
  type        = list(string)
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "public_subnets" {
  type        = list(string)
  default = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}