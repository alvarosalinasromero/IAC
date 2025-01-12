# Both blocks will produce the same result, 
# but the second block is more readable and maintainable because it uses a clear and descriptive name for the iterator.

variable "sg_ports" {
  type = list(number)
  description = "List of ingress ports"
  default = [80, 443, 22, 3389]
}

resource "aws_security_group" "mysg" {
  name = "myfirewall"
  description = "Firewall for the server"

#   dynamic "ingress" {
#     for_each = var.sg_ports
#     content {
#       from_port = ingress.value
#       to_port = ingress.value
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}