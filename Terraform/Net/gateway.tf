resource "aws_eip" "eip" {
  vpc = true
  tags {
    Name = "cccristancho_EIP"
    created_by = "${var.tags["created_by"]}"
    project_name = "${var.tags["project_name"]}"
    start = "${var.tags["start"]}"
    stop = "${var.tags["stop"]}"  
  }
}

resource "aws_nat_gateway" "NatGW" {

  allocation_id = "${aws_eip.eip.id}"
  subnet_id = "${aws_subnet.private-subnet.0.id}"
  depends_on = ["aws_eip.eip"]

  tags {
    Name = "cccristancho_NAT_Gateway"
    created_by = "${var.tags["created_by"]}"
    project_name = "${var.tags["project_name"]}"
    start = "${var.tags["start"]}"
    stop = "${var.tags["stop"]}"  
  }
}

resource "aws_internet_gateway" "IntGW" {

  vpc_id = "${aws_vpc.VPC.id}"
  tags {
    Name = "cccristancho_Inter_Gateway"
    created_by = "${var.tags["created_by"]}"
    project_name = "${var.tags["project_name"]}"
    start = "${var.tags["start"]}"
    stop = "${var.tags["stop"]}"  
  }
}
