variable "vpc_id"{
    type        = string
}

variable "pub_subnets"{
  type        = list(object({
    subnets_cidr      = string
    availability_zone = string
  }))
}

variable "igw_id"{
    type = string
}

variable "priv_subnets"{
  type = list(object({
    subnets_cidr = string
    availability_zone = string
  }))
}

variable "nat_id"{
    type = string
}