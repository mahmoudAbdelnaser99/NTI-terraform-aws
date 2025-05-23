variable "profile" {}
variable "region" {}
variable "vpc_cidr"{}
variable "lb_internal"{}

variable "pub_subnet"{
    type              = list(object({
    subnets_cidr      = string
    availability_zone = string
  }))
}

variable "priv_subnet"{
    type              = list(object({
    subnets_cidr      = string
    availability_zone = string
  }))
}



