resource "aws_vpc" "devops_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devops-vpc"
  }
}
