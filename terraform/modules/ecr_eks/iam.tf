resource "aws_iam_user" "ecr_eks_iam" {
  name = var.project_name
}

resource "aws_iam_access_key" "ecr_eks_iam_access_key" {
  user = aws_iam_user.ecr_eks_iam.name
}
