/*
Lab 5: Create a MySQL database instance in AWS RDS and Azure Database for MySQL using Terraform.
Using provider azure rm 3.0, not required a subcription ID in the provider block.2
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "aws_vpc" "default" {
  default = true
}
/*
Name: quiere decir el nombre del campo que se va a filtrar
Values: es el valor que va a tener ese campo
*/
data "aws_security_group" "sg" {
  filter {
    name   = "description"
    values = ["SG Dynamic"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_sg_id" {
  value = data.aws_security_group.sg.id
}

output "default_vpc_subnets" {
  value = data.aws_subnets.default_vpc_subnets.ids
}

resource "random_password" "rds" {
  length  = 16
  special = true
}

resource "aws_db_instance" "db_alvaro" {
  db_name                 = "lab-mysql-alvaro"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "adminuser"
  password                = random_password.rds.result
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 0
  multi_az                = false
  storage_type            = "gp2"
  publicly_accessible     = false

  vpc_security_group_ids = [data.aws_security_group.sg.id]
  #db_subnet_group_name = data.aws_subnets.default_vpc_subnets[0]
  tags = {
    Name = "rds-alvaro"
  }
}

resource "azurerm_mysql_flexible_server" "deb_azure" {
  name                          = "lab-mysql-alvaro"
  resource_group_name           = "MSG-alvaro"
  location                      = "west europe"
  administrator_login           = "adminuser"
  administrator_password        = random_password.rds.result
  sku_name                      = "B_Standard_B1ms"

  tags = {
    environment = "lab-5"
  }

}