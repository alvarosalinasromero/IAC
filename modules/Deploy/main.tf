module "ec2_instance" {
  source  = "../instance"
  
  instance_name              = "test-ec2"
  ami                        = "ami-066734adba283ab4b"
  instance_type              = "t3.micro"
  key_name                   = "my-key-pair"
  vpc_security_group_ids     = [module.security-group.security_group_id]
  subnet_id                  = data.aws_subnet_ids.public.ids[0]
  
  tags = {
    Name        = "Test-EC2"
    Environment = "Dev"
    Terraform   = "true"
  }
  depends_on = [module.security-group]
}

module "security-group" {
  source  = "../SG"

  name_sg             = "test-sg"
  description         = "Security group for test instance"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  vpc_id =  data.aws_vpc.default.id

  tags = {
    Name        = "Test-SG"
    Environment = "Dev"
    Terraform   = "true"
  }

  # Security group rules
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
]
 egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
]

  depends_on = [data.aws_vpc.default]
}

data "aws_vpc" "default" {
  default = true
}

# data "aws_subnets" "public" {
#   filter {
#     name   = "vpc-id"
#     values = data.aws_subnets.public.ids[0]
#   }

#   filter {
#     name   = "tag:Tier"
#     values = ["public"]
#   }
# }