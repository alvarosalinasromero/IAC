variable "sg_ip" {
    default = "0.0.0.0/0"
    description = "IP address to the server"
}

variable "sg_port_http" {
    default = 80
    description = "HTTP port"
}

variable "sg_port_https" {
    default = 443
    description = "HTTPS port"
}

variable "sg_protocol" {
    default = "tcp"
    description = "TCP protocol"
}