output "aws_ecr_repository_ecr_repository_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}

output "aws_eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "aws_ecr_name" {
  value = aws_ecr_repository.ecr_repository.name
}


output "region" {
  value = var.region
}
