module "ecr_eks" {
  source        = "../../modules/ecr_eks"

  project_name  = "pr-qa-env"
  region        = "us-east-1"
  instance_type = "t3.medium"
}

output "aws_ecr_repository_pr_qa_env_repository_url" {
  value = module.ecr_eks.aws_ecr_repository_ecr_repository_url
}

output "aws_eks_cluster_name" {
  value = module.ecr_eks.aws_eks_cluster_name
}

output "aws_ecr_name" {
  value = module.ecr_eks.aws_ecr_name
}

output "region" {
  value = module.ecr_eks.region
}
