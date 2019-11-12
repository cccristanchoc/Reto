resource "aws_subnet" "public-subnet" {

    vpc_id              = "${aws_vpc.VPC.id}"
    count               = "${length(var.public_subnets_cidr)}"
    cidr_block          = "${element(var.public_subnets_cidr, count.index)}"
    availability_zone   = "${element(var.avalaible_zones, count.index)}"
    
    tags {
        Name            = "cccristancho_SubNet_Public_${count.index+1}"
        created_by      = "${var.tags["created_by"]}"
        project_name    = "${var.tags["project_name"]}"
        start           = "${var.tags["start"]}"
        stop            = "${var.tags["stop"]}"  
    }

}

resource "aws_subnet" "private-subnet" {

    vpc_id              = "${aws_vpc.VPC.id}"
    count               = "${length(var.private_subnet_cidr)}"
    cidr_block          = "${element(var.private_subnet_cidr, count.index)}"
    availability_zone   = "${element(var.avalaible_zones, count.index)}"

    tags {
        Name            = "cccristancho_SubNet_Private_${count.index+1}"
        created_by      = "${var.tags["created_by"]}"
        project_name    = "${var.tags["project_name"]}"
        start           = "${var.tags["start"]}"
        stop            = "${var.tags["stop"]}"  
    }

}