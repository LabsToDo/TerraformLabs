resource "aws_iam_policy" "ec2_policy" {
  name = "ec2-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Start*",
          "ec2:Stop*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_policy_attachment" "ec2_attach" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
  depends_on = [ aws_iam_role.ec2_role, aws_iam_policy.ec2_policy ]
}

