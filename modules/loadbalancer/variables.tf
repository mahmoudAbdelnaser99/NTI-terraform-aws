variable "lb_vpc_id"{
    type = string
}

variable "pub_target_id"{
    type = list(string)
}

variable "priv_target_id"{
    type = list(string)
}

variable "lb_internal"{
    type = list(bool)
}

variable "lb_subnets"{
    type = list(list(string))
}

variable "lb_sg_id"{}
