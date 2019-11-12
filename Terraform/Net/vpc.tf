resource "aws_vpc" "VPC" {
    
    cidr_block = "${var.vpc_cidr}"

    tags {
        Name            = "cccristancho_VPC"
        created_by      = "${var.tags["created_by"]}"
        project_name    = "${var.tags["project_name"]}"
        start           = "${var.tags["start"]}"
        stop            = "${var.tags["stop"]}"  
    }
}