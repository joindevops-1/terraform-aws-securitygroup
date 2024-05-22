#### Project ####
variable "project_name"{
    type = string
}

variable "environment"{
    type = string
    default = "dev"
}

variable "common_tags"{
    type = map
}

#### SG ####
variable "sg_name" {
  type = string
  default = ""
}

variable "sg_description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_tags" {
  type = map
  default = {}
}

variable "egress_rules" {
  type = list
  default = [
    {
        from_port = 0,
        to_port = 0,
        allowed_cidr = ["0.0.0.0/0"]
        protocol         = "-1"
    }
  ]
}

variable "ingress_rules" {
  type = list
  default = []
}