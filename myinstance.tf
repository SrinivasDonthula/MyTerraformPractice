resource "aws_instance" "my_web_instance" {
    ami = "${lookup(var.images,var.region}"
    instance_type = "t2.micro"
    key_name = "SingaPore2KeyPair.pem"
    vpc_security_group_ids = ["${aws_security_group.web_security_group.id}"]
    subnet_id = "${aws_subnet.myvpc_public_subnet.id}"
    tags = {
        Name = "my_web_instance"
    }
    volume_tags = {
        Name = "my_web_instance_volume"
    }

provisioner "remote-exec" {
    inline = [
"sudo mkdir -p /var/www/html/",
"sudo yum update -y",
"sudo yum install -y httpd",
"sudo service httpd start",
"sudo usermod -a -G apache ec2-user",
"sudo chown -R ec2-user:apache /var/www",
"sudo yum install -y mysql php php-mysql"
    ]
}