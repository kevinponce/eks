resource "aws_iam_user" "github_actions_role_iam" {
  name = "github_actions_role_iam"
}

data "aws_iam_policy_document" "github_actions_user_policy_document" {
  statement {
    actions   = [
      "eks:*",
      "ecr:*"
    ]
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "github_actions_user_policy" {
  name        = "github_actions_user_policy"
  description = "Github Action to build ecr and deploy through eks"
  policy = data.aws_iam_policy_document.github_actions_user_policy_document.json
}

resource "aws_iam_user_policy_attachment" "github_actions_user_policy_attachment" {
  user       = aws_iam_user.github_actions_role_iam.name
  policy_arn = aws_iam_policy.github_actions_user_policy.arn
}

resource "aws_iam_access_key" "github_actions" {
  user = aws_iam_user.github_actions_role_iam.name
}

output "github_actions_user_id" {
  value = aws_iam_access_key.github_actions.id
}
