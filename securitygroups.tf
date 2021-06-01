resource "aws_security_group" "web_security_group" {
name = "web_security_group"
description = "Allow all inbound traffic"
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "myvpc_web_security_group"
}
}

resource "aws_security_group_rule" "web_ingress" {
count = "${length(var.web_ports)}"
type = "ingress"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
from_port = "${element(var.web_ports, count.index)}"
to_port = "${element(var.web_ports, count.index)}"
security_group_id = "${aws_security_group.web_security_group.id}"
}

resource "aws_security_group_rule" "web_egress" {
count = "${length(var.web_ports)}"
type = "egress"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
from_port = "${element(var.web_ports, count.index)}"
to_port = "${element(var.web_ports, count.index)}"
security_group_id = "${aws_security_group.web_security_group.id}"
}

#creating security group for db
resource "aws_security_group" "db_security_group" {
name = "db_security_group"
description = "Allow all inbound traffic"
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
    Name = "myvpc_db_security_group"
}
}

#creating security group ingress rules for db
resource "aws_security_group_rule" "db_ingress" {
count = "${length(var.db_ports)}"
type = "ingress"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
from_port = "${element(var.db_ports, count.index)}"
to_port = "${element(var.db_ports, count.index)}"
security_group_id = "${aws_security_group.db_security_group.id}"
}

#creating security group egress rules for db
resource "aws_security_group_rule" "db_egress" {
count = "${length(var.db_ports)}"
type = "egress"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
from_port = "${element(var.db_ports, count.index)}"
to_port = "${element(var.db_ports, count.index)}"
security_group_id = "${aws_security_group.db_security_group.id}"
}