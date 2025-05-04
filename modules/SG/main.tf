module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = var.name_sg
  description = var.description
  vpc_id      = data.aws_vpc.default.id

  tags = var.tags

}