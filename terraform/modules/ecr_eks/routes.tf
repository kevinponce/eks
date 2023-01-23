resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ecr_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecr_eks_igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public-region-a" {
  subnet_id      = aws_subnet.public-region-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-region-b" {
  subnet_id      = aws_subnet.public-region-b.id
  route_table_id = aws_route_table.public.id
}
