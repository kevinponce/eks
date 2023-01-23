locals {
  eks_name = {
    value = "${var.project_name}-eks-cluster"
  }
}

resource "aws_subnet" "public-region-a" {
  vpc_id                  = aws_vpc.ecr_eks_vpc.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                   = "${local.eks_name.value}public-${var.region}a"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.eks_name.value}" = "owned"
  }
}

resource "aws_subnet" "public-region-b" {
  vpc_id                  = aws_vpc.ecr_eks_vpc.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                   = "${local.eks_name.value}-public-${var.region}b"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.eks_name.value}" = "owned"
  }
}
