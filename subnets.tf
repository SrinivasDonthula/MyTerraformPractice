resource "aws_subnet" "myvpc_public_subnet" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${var.subnet_one_cidr}"
    availability_zone = "${var.availability_zone_name}"
    map_public_ip_on_launch = true
    tags = {
        Name = "myvpc_public_subnet"
    }
}

resource "aws_subnet" "myvpc_private_subnet_one" {
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "${element(var.subnet_two_cidr, 0)}"
availability_zone = "${var.availability_zone_name}}"
tags = {
   Name = "myvpc_private_subnet_one"
  }
}

resource "aws_subnet" "myvpc_private_subnet_two" {
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "${element(var.subnet_two_cidr, 1)}"
availability_zone = "${var.availability_zone_name}"
tags = {
   Name = "myvpc_private_subnet_two"
  }
}