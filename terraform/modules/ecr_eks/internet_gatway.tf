resource "aws_internet_gateway" "ecr_eks_igw" {
  vpc_id = aws_vpc.ecr_eks_vpc.id

  tags = {
    Name = "igw"
  }
}