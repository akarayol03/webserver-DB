resource "aws_instance" "web-1" {
    ami = "ami-066e477209039595b"
    availability_zone = "us-west-2"
    instance_type = "t3.nano"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = "sg-d3ca99b5"
    vpc_id             = "vpc-97e7b1f3"
    subnet_id = "${aws_subnet.sa-east-1a-public.id}"
    associate_public_ip_address = true
    source_dest_check = false


    tags {
        Name = "Web Server 1"
    }
}

resource "aws_instance" "web-1" {
  # ...

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install curl",
      "curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -",
      "sudo apt-get install nodejs",
    ]
  }
}


resource "aws_instance" "db-1" {
    ami = "ami-066e477209039595b"
    availability_zone = "us-west-2"
    instance_type = "t3.nano"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = "sg-d3ca99b5"
    vpc_id             = "vpc-97e7b1f3"
    subnet_id = ""
    source_dest_check = false

    tags {
        Name = "DB Server 1"
    }
}

resource "aws_instance" "db-1" {
  # ...

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install curl",
      "sudo apt-get install wget",
      "wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb",
      "dpkg -i mysql-apt-config_0.8.10-1_all.deb",
      "sudo apt-get update",
      "sudo apt-get install mysql-server",
    ]
  }
}
