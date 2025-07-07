

resource "aws_instance" "this" {
  count         = var.instance_count
  
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  
  tags = merge(var.tags,
    {
      Name = "${var.instance_name}-${count.index}"
    },
  )

}