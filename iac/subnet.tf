resource "aws_subnet" "devops_subnet" {
  vpc_id                  = aws_vpc.devops_vpc.id
  count                   = 2
  cidr_block              = cidrsubnet(aws_vpc.devops_vpc.cidr_block, 8, count.index)
  availability_zone       = element(["eu-west-1a", "eu-west-1b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-subnet-${count.index}"
  }
}
