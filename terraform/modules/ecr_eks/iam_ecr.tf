data "aws_iam_policy_document" "ecr_iam_policy_document" {
  statement {
    actions   = [
      "ecr:*"
    ]
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "ecr_iam_user_policy" {
  name        = "${var.project_name}-user-policy"
  description = "Build ecr and deploy through eks"
  policy = data.aws_iam_policy_document.ecr_iam_policy_document.json
}

resource "aws_iam_user_policy_attachment" "github_actions_user_policy_attachment" {
  user       = aws_iam_user.ecr_eks_iam.name
  policy_arn = aws_iam_policy.ecr_iam_user_policy.arn
}
