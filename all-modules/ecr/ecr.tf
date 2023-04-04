resource "aws_ecr_repository" "myrepo" {
  name                 = var.repository_name
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    name = var.repository_name
  }
}
data "aws_iam_policy_document" "mypolicy" {
  statement {
    sid    = "new policy"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]
  }
}

resource "aws_ecr_repository_policy" "myrepo_policy" {
  repository = aws_ecr_repository.myrepo.name
  policy     = data.aws_iam_policy_document.mypolicy.json
}