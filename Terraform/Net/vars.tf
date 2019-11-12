variable "aws_region" {
    description = "EC2 Region for the VPC"
}

variable "vpc_cidr" {
  description = "CIDR for the Public Subnet"
}


variable "public_subnets_cidr" {
    description = "CIDR for the Public Subnet"
    type = "list"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    type = "list"
}

variable "avalaible_zones" {
    description = "Availability Zones to use in vpc"
    type = "list"
}

variable "tags" {
    description = "tags ccristancho"
    type = "map"
}