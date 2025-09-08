provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "mysg2" {
  description = "mysg2"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = -1
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "icmp"
    security_groups  = []
    self             = false
    to_port          = -1
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "sgmanually2"
  name_prefix            = null
  region                 = "eu-west-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-060dd0fa37bfb4264"
}

# import {
#   # 'to' apunta al recurso de arriba, sin comillas.
#   to = aws_security_group.mysg2

#   # 'id' es el ID real del recurso en AWS.
#   id = "sg-044e5f8837514b6b1" # <-- ¡Pega aquí el ID de tu nuevo SG!
# }