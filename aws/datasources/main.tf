# Data source is used to get information about an existing resource

data "aws_instance" "ubuntu" {
    instance_id = "i-0df0685126b737ff3"
}

output "instance_details" {
    value = {
        ami = data.aws_instance.ubuntu.ami
        instance_type = data.aws_instance.ubuntu.instance_type
        id = data.aws_instance.ubuntu.id
        public_ip = data.aws_instance.ubuntu.public_ip
        private_ip = data.aws_instance.ubuntu.private_ip
        availability_zone = data.aws_instance.ubuntu.availability_zone
        tags = data.aws_instance.ubuntu.tags
        key_name = data.aws_instance.ubuntu.key_name
    }

}
