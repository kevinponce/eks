resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.23"

  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = "10.100.0.0/16"
  }  

  vpc_config {
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
    public_access_cidrs     = ["0.0.0.0/0"]
    subnet_ids              = [
      aws_subnet.public-region-a.id,
      aws_subnet.public-region-b.id
    ]
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  capacity_type   = "ON_DEMAND"
  cluster_name    = aws_eks_cluster.eks_cluster.name
  disk_size       = "10"
  instance_types  = [var.instance_type]
  node_group_name = "${aws_eks_cluster.eks_cluster.name}InstanceType"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  scaling_config {
    desired_size = "1"
    max_size     = "2"
    min_size     = "1"
  }

  subnet_ids = [
    aws_subnet.public-region-a.id,
    aws_subnet.public-region-b.id
  ]

  update_config {
    max_unavailable = "1"
  }

  version = "1.23"
}

resource "aws_eks_addon" "eks-cni-addon" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "eks-coredns-addon" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "coredns"
}

resource "aws_eks_addon" "eks-kube-proxy-addon" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "kube-proxy"
}
