resource "aws_ecr_repository" "pr_env" {
  name                 = "pr_env"
  image_tag_mutability = "MUTABLE"
  force_delete         = "true"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "aws_ecr_repository_pr_env_repository_url" {
  value = aws_ecr_repository.pr_env.repository_url
}
