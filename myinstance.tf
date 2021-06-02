resource "aws_instance" "my_web_instance" {
    ami = "${lookup(var.images,var.region)}"
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
"sudo usermod -a -G apache ubuntu",
"sudo chown -R ubuntu:apache /var/www",
"sudo yum install -y mysql php php-mysql"
    ]
}
provisioner "file" {
    source = "index.php"
    destination = "/var/www/html/index.php"
}
connection {
    type = "ssh"
    user = "ubuntu"
    password = ""
    private_key = "${file("/root/MyTerraformPractice/SingaPore2KeyPair.pem")}"
 }
}
