resource "aws_route_table" "devops_route_table" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }

  tags = {
    Name = "devops-route-table"
  }
}

resource "aws_route_table_association" "devops_route_table_association" {
  route_table_id = aws_route_table.devops_route_table.id
  subnet_id      = aws_subnet.devops_subnet[count.index].id
  count          = 2
}
