module "ec2_instance_internal" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  name                     = var.instance_name
  ami                      = var.ami
  instance_type            = var.instance_type
  key_name                 = var.key_name
  vpc_security_group_ids   = var.vpc_security_group_ids

  tags = var.tags
}